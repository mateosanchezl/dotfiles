return {
  "akinsho/bufferline.nvim",
  lazy = false,
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup {
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "",
            highlight = "Directory",
            separator = true,
          },
        },
        always_show_bufferline = false,
      },
    }
  end,
}
