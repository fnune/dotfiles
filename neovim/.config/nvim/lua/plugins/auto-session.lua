require("auto-session").setup {
  log_level = 'error',
  bypass_session_save_file_types = { 'NvimTree', 'undotree' },
}
