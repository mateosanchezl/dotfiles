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
            filetype = "Neotree",
            text = "Neotree",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    }
  end,
}
