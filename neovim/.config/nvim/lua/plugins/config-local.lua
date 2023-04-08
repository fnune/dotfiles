require('config-local').setup {
  config_files = { ".vim/init.lua" },
  autocommands_create = true,
  commands_create = true,
  silent = false,
  lookup_parents = false,
}
