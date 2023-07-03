local constants = require("constants")
return {
  "nvim-orgmode/orgmode",
  config = function()
    local orgmode = require("orgmode")
    local refile = "~/.journal/org/refile.org"

    orgmode.setup_ts_grammar()

    orgmode.setup({
      org_agenda_files = { "~/.journal/org/*" },
      org_default_notes_file = refile,
      org_log_into_drawer = "LOGBOOK",
      org_todo_keywords = { "TODO(t)", "|", "DONE(d)" },
      org_hide_leading_stars = true,
      org_capture_templates = {
        t = { description = "(t) Task", template = "\n* TODO %?\n  %U" },
        n = { description = "(n) Note", template = "\n* %?\n  %U" },
        x = { description = "(mc) Meeting: create", template = "\n* Meeting: %^{Meeting title}\n  %U\n  %?" },
        y = { description = "(mm) Meeting: meeting minutes", template = "** %U %?" },
        z = { description = "(ma) Meeting: actionable", template = "** TODO %?" },
      },
      win_border = constants.floating_border,
      win_split_mode = "float",
      ui = {
        menu = {
          handler = function(data)
            local options = {}
            local options_by_label = {}

            for _, item in ipairs(data.items) do
              if item.key and item.label:lower() ~= "quit" then
                table.insert(options, item.label)
                options_by_label[item.label] = item
              end
            end

            local handler = function(choice)
              if not choice then
                return
              end

              local option = options_by_label[choice]
              if option.action then
                option.action()
              end
            end

            vim.ui.select(options, { prompt = data.propmt }, handler)
          end,
        },
      },
    })

    vim.cmd([[ autocmd FileType org setlocal conceallevel=3 | setlocal nowrap | setlocal foldlevel=99 ]])

    local m = require("mapx")

    m.nmap("<leader>oe", ":e " .. refile .. "<CR>G", "Open the default notes file in a new tab",
      { silent = true })
  end
}
