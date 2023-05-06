return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    init = function()
      vim.cmd([[colorscheme rose-pine]])
    end
  }
}
