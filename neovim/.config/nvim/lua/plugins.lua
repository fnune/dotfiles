if not vim.fn.executable('node') then
  os.execute('volta install node')
end

if not vim.fn.executable('yarn') then
  os.execute('volta install yarn')
end

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('APZelos/blamer.nvim')
Plug('AndrewRadev/tagalong.vim')
Plug('Raimondi/delimitMate')
Plug('levouh/tint.nvim')
Plug('lewis6991/gitsigns.nvim')
Plug('christoomey/vim-tmux-navigator')
Plug('editorconfig/editorconfig-vim')
Plug('farmergreg/vim-lastplace')
Plug('machakann/vim-swap')
Plug('markonm/traces.vim')
Plug('matze/vim-move')
Plug('mhartington/formatter.nvim')
Plug('mkitt/tabline.vim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-treesitter/completion-treesitter')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = '<cmd>TSUpdate' })
Plug('rose-pine/neovim')
Plug('rrethy/vim-hexokinase', { ['do'] = 'make hexokinase' })
Plug('tmhedberg/matchit')
Plug('tpope/vim-abolish')
Plug('tpope/vim-commentary')
Plug('tpope/vim-eunuch')
Plug('tpope/vim-repeat')
Plug('mbbill/undotree')
Plug('tpope/vim-rhubarb')
Plug('tpope/vim-surround')
Plug('tversteeg/registers.nvim')
Plug('kyazdani42/nvim-web-devicons')
Plug('kdheepak/lazygit.nvim')
Plug('romgrk/barbar.nvim')
Plug('kyazdani42/nvim-tree.lua')
Plug('rmagatti/auto-session')
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug('tpope/vim-dadbod')
Plug('kristijanhusak/vim-dadbod-ui')
Plug('LnL7/vim-nix')
Plug('jxnblk/vim-mdx-js')
Plug('folke/which-key.nvim')
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('vimwiki/vimwiki')
Plug('sindrets/diffview.nvim')
Plug('tyru/open-browser.vim')
Plug('tyru/open-browser-github.vim')

vim.call('plug#end')

vim.g.blamer_delay = 750
vim.g.blamer_enabled = 1
vim.g.blamer_relative_time = 1
vim.g.blamer_show_in_visual_modes = 0
vim.g.blamer_show_in_insert_modes = 0

vim.g.traces_abolish_integration = 1

require('bufferline').setup {
    animation = false,
    closable = false,
    clickable = false,
    icons = 'both',
}

local file_explorer_width_chars = 40

require('nvim-tree').setup {
    view = { width = file_explorer_width_chars, },
    diagnostics = { enable = true, show_on_dirs = true },
    renderer = { group_empty = true },
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function(tbl)
    local set_offset = require('bufferline.api').set_offset

    local bufwinid
    local last_width
    local autocmd = vim.api.nvim_create_autocmd('WinScrolled', {
      callback = function()
        bufwinid = bufwinid or vim.fn.bufwinid(tbl.buf)

        local width = vim.api.nvim_win_get_width(bufwinid)
        if width ~= last_width then
          set_offset(width, 'FileTree')
          last_width = width
        end
      end,
    })

    vim.api.nvim_create_autocmd('BufWipeout', {
      buffer = tbl.buf,
      callback = function()
        vim.api.nvim_del_autocmd(autocmd)
        set_offset(0)
      end,
      once = true,
    })
  end,
  pattern = 'NvimTree',
})

require("auto-session").setup { log_level = 'error' }

-- https://github.com/kdheepak/lazygit.nvim
vim.cmd([[
  if has('nvim') && executable('nvr')
    let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
  endif
]])

vim.cmd([[
  let wiki = {}
  let wiki.path = '~/.journal'
  let wiki.diary_rel_path = 'notes'
  let wiki.syntax = 'markdown'
  let wiki.ext = '.md'
  let wiki.auto_diary_index = 1

  let g:vimwiki_list = [wiki]

  function! ConfigureMarkdownVimwiki() abort
    set number
    set textwidth=74
    set wrapmargin=0
    set formatoptions+=t
    set linebreak
  endfunction

  autocmd FileType markdown call ConfigureMarkdownVimwiki()
  autocmd FileType vimwiki  call ConfigureMarkdownVimwiki()
]])

require("which-key").setup {}

require('telescope').setup {
    defaults = {
        file_ignore_patterns = { ".git/*", ".cache/*" },
    },
}
require('telescope').load_extension('fzf')

require('diffview').setup {
    hooks = {
        diff_buf_read = function(_)
          vim.g.blamer_enabled = 0
        end,
    },
    enhanced_diff_hl = true,
    use_icons = true,
    file_panel = {
        win_config = {
            width = file_explorer_width_chars,
        },
    },
}

require('gitsigns').setup {}

require("tint").setup({
    tint = -10,
    tint_background_colors = true,
    saturation = 0.8,
    window_ignore_function = function(winid)
      local bufid = vim.api.nvim_win_get_buf(winid)
      local bufname = vim.api.nvim_buf_get_name(bufid)

      if string.find(bufname, "NvimTree_1") then
        return false
      end

      return true
    end
})
