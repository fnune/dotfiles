local m = require("mapx")

return {
  "neoclide/coc.nvim",
  branch = "release",
  init = function()
    vim.g.coc_global_extensions = {
      "coc-clangd",
      "coc-db",
      "coc-pairs",
      "coc-docker",
      "coc-eslint",
      "coc-jest",
      "coc-json",
      "coc-prettier",
      "coc-pyright",
      "coc-rust-analyzer",
      "coc-sh",
      "coc-sql",
      "coc-sumneko-lua",
      "coc-toml",
      "coc-tsserver",
      "coc-vimlsp",
      "coc-yaml",
    }

    -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
    vim.api.nvim_create_augroup("CocGroup", {})
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "CocGroup",
      command = "silent call CocActionAsync('highlight')",
      desc = "Highlight symbol under cursor on CursorHold"
    })

    -- Update signature help on jump placeholder
    vim.api.nvim_create_autocmd("User", {
      group = "CocGroup",
      pattern = "CocJumpPlaceholder",
      command = "call CocActionAsync('showSignatureHelp')",
      desc = "Update signature help on jump placeholder"
    })

    -- Autocomplete
    function _G.check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end

    -- Use Tab to trigger completion with characters ahead and navigate
    m.inoremap("<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
      { silent = true, expr = true })
    m.inoremap("<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], { silent = true, expr = true })

    -- Make <cr> accept selected completion item or notify coc.nvim to format
    m.inoremap("<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"]],
      { silent = true, expr = true })

    -- Use <c-space> to trigger completion
    m.inoremap("<c-space>", "coc#refresh()", { silent = true, expr = true })

    m.nmap("<leader>k", "<Plug>(coc-diagnostic-prev)", "Previous diagnostic")
    m.nmap("<leader>j", "<Plug>(coc-diagnostic-next)", "Next diagnostic")

    m.nname("g", "Go to")
    m.nmap("gd", "<Plug>(coc-definition)", { silent = true }, "Go to definition")
    m.nmap("gy", "<Plug>(coc-type-definition)", { silent = true }, "Go to type definition")
    m.nmap("gi", "<Plug>(coc-implementation)", { silent = true }, "Go to implementation")
    m.nmap("gr", "<Plug>(coc-references)", { silent = true }, "View references")

    function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
      else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
    end

    m.nmap("K", '<cmd>lua _G.show_docs()<cr>', "Show hover documentation")

    m.nmap("<leader>r", "<Plug>(coc-rename)", { silent = true }, "Rename symbol")

    m.nmap("<leader>p", ":call CocActionAsync('runCommand', 'editor.action.formatDocument')<cr>", { silent = true },
      "Format document")
    m.nmap("<C-M-o>", ":call CocActionAsync('runCommand', 'editor.action.organizeImport')<cr>", { silent = true },
      "Organize imports")

    -- Remap <C-f> and <C-b> to scroll float windows/popups
    m.nmap("<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"')
    m.nmap("<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"')
    m.imap("<C-f>",
      'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"')
    m.imap("<C-b>",
      'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"')
    m.vmap("<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"')
    m.vmap("<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"')

    m.nname("<leader>a", "Code actions")

    -- Apply codeAction to the selected region
    -- Example: `<leader>aap` for current paragraph
    m.xmap("<leader>av", "<Plug>(coc-codeaction-selected)", { silent = true, nowait = true }, "Visual code action")
    m.nmap("<leader>av", "<Plug>(coc-codeaction-selected)", { silent = true, nowait = true }, "Motion code action")

    -- Remap keys for apply code actions at the cursor position.
    m.nmap("<leader>ac", "<Plug>(coc-codeaction-cursor)", { silent = true, nowait = true }, "Cursor code action")
    -- Remap keys for apply code actions affect whole buffer.
    m.nmap("<leader>as", "<Plug>(coc-codeaction-source)", { silent = true, nowait = true }, "Buffer code action")
    -- Remap keys for applying codeActions to the current buffer
    m.nmap("<leader>ab", "<Plug>(coc-codeaction)", { silent = true, nowait = true }, "File code action")
    -- Apply the most preferred quickfix action on the current line.
    m.nmap("<leader>aq", "<Plug>(coc-fix-current)", { silent = true, nowait = true }, "Quick fix")

    -- Remap keys for apply refactor code actions.
    m.nmap("<leader>ar", "<Plug>(coc-codeaction-refactor)", { silent = true }, "Refactor")
    m.xmap("<leader>arv", "<Plug>(coc-codeaction-refactor-selected)", { silent = true }, "Visual refactor")
    m.nmap("<leader>arv", "<Plug>(coc-codeaction-refactor-selected)", { silent = true }, "Motion refactor")

    -- Run the Code Lens actions on the current line
    m.nmap("<leader>al", "<Plug>(coc-codelens-action)", { silent = true, nowait = true }, "Code Lens")

    -- Map function and class text objects
    m.xmap("if", "<Plug>(coc-funcobj-i)", { silent = true, nowait = true })
    m.omap("if", "<Plug>(coc-funcobj-i)", { silent = true, nowait = true })
    m.xmap("af", "<Plug>(coc-funcobj-a)", { silent = true, nowait = true })
    m.omap("af", "<Plug>(coc-funcobj-a)", { silent = true, nowait = true })
    m.xmap("ic", "<Plug>(coc-classobj-i)", { silent = true, nowait = true })
    m.omap("ic", "<Plug>(coc-classobj-i)", { silent = true, nowait = true })
    m.xmap("ac", "<Plug>(coc-classobj-a)", { silent = true, nowait = true })
    m.omap("ac", "<Plug>(coc-classobj-a)", { silent = true, nowait = true })
  end
}
