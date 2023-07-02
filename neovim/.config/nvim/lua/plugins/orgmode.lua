local constants = require("constants")
return {
  "nvim-orgmode/orgmode",
  config = function()
    local orgmode = require("orgmode")

    orgmode.setup_ts_grammar()

    orgmode.setup({
      org_agenda_files = { "~/.journal/org/*" },
      org_default_notes_file = "~/.journal/org/refile.org",
      org_log_into_drawer = "LOGBOOK",
      org_todo_keywords = { "TODO(t)", "|", "DONE(d)" },
      win_border = constants.floating_border,
      win_split_mode = "float",
    })
  end
}
