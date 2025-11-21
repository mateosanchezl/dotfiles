local nvchad_config = require("nvchad.configs.nvimtree")

return vim.tbl_deep_extend("force", nvchad_config, {
  view = {
    side = "right",
  },
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
  },
  auto_close = true,
})
