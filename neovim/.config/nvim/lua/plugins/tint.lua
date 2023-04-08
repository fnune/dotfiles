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
