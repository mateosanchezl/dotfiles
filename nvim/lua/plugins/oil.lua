return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  config = function()
    require("oil").setup {
      columns = {
        "permissions",
        "icon",
      },
      float = {
        max_width = 0.7,
        max_height = 0.6,
        border = "rounded",
      },
    }
  end,
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  lazy = false,
}
