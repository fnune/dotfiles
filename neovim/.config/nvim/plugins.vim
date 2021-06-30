if !executable('node')
  !volta install node
endif

if !executable('yarn')
  !volta install yarn
endif

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
      silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Generic
Plug 'AndrewRadev/tagalong.vim'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'brooth/far.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'fenetikm/falcon'
Plug 'jgdavey/tslime.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'machakann/vim-swap'
Plug 'markonm/traces.vim'
Plug 'mcchrish/nnn.vim'
Plug 'mhartington/formatter.nvim'
Plug 'mkitt/tabline.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'

" Technology-specific
Plug 'NoahTheDuke/vim-just'
Plug 'fladson/vim-kitty'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'jxnblk/vim-mdx-js'
Plug 'pantharshit00/vim-prisma'

" Treesitter
Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" LSP
Plug 'RishabhRD/nvim-lsputils'
Plug 'RishabhRD/popfix'
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'onsails/lspkind-nvim'

call plug#end()

let g:vim_svelte_plugin_load_full_syntax = 1
let g:nnn#command = 'nnn -H'
let g:nnn#layout = { 'window': { 'width': 0.6, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = { '<c-x>': 'split', '<c-v>': 'vsplit', '<c-t>': 'tab split' }

let test#strategy = "tslime"
let test#filename_modifier = ':p'
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
let g:tslime_autoset_pane = 1

let g:gitgutter_grep = 'rg'

let g:traces_abolish_integration = 1

let g:fugitive_git_executable = 'hub'

sign define LspDiagnosticsSignError text=🔴
sign define LspDiagnosticsSignWarning text=🟠
sign define LspDiagnosticsSignInformation text=🔵
sign define LspDiagnosticsSignHint text=🟢

lua << EOF
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require("nvim-lsp-ts-utils").setup {}
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  lsp_status.on_attach(client, bufnr)

  -- Mappings.
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', '<leader>o', ':TSLspOrganize<CR>', opts)
  buf_set_keymap('n', '<leader>af', ':TSLspFixCurrent<CR>', opts)
  buf_set_keymap('n', '<leader>rf', ':TSLspRenameFile<CR>', opts)
  buf_set_keymap('n', '<leader>O', ':TSLspImportAll<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>j', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

nvim_lsp.rust_analyzer.setup { on_attach = on_attach, capabilities = lsp_status.capabilities }
nvim_lsp.tsserver.setup { on_attach = on_attach, capabilities = lsp_status.capabilities }
nvim_lsp.ccls.setup { on_attach = on_attach, capabilities = lsp_status.capabilities }
nvim_lsp.pyls.setup {
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
  pyls = { plugins = { pyls_mypy = { enabled = true }, pyls_black = { enabled = true } } },
}

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})
EOF

lua <<EOF
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
EOF

if isdirectory($PWD .'/node_modules')
      let $PATH .= ':' . $PWD . '/node_modules/.bin'
endif

lua <<EOF
local prettier = {
      function()
            return {
                  exe = "prettier",
                  args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                  stdin = true
                  }
      end
      }

require('formatter').setup({
logging = false,
filetype = {
      css = prettier,
      scss = prettier,
      javascript = prettier,
      typescript = prettier,
      typescriptreact = prettier,
      json = prettier,
      markdown = prettier,
      html = prettier,
      ["markdown.mdx"] = prettier,
      python = {
            function()
                  return {
                        exe = "black",
                        args = {"-"},
                        stdin = true
                        }
            end
            },
      rust = {
            function()
                  return {
                        exe = "rustfmt",
                        args = {"--emit=stdout"},
                        stdin = true
                        }
            end
            },
      c = {
            function()
                  return {
                        exe = "clang-format",
                        stdin = true
                  }
            end
            },
      },
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.css,*.scss,*.mdx,*.py,*.ts,*.tsx,*.md FormatWrite
augroup END

set completeopt=menuone,noselect

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 0
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.resolve = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.spell = v:true
let g:compe.source.tags = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-b>     compe#scroll({ 'delta': -4 })

set shortmess+=c
