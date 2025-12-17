return {
  "akinsho/bufferline.nvim",
  lazy = false,
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require "bufferline"
    bufferline.setup {
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
        buffer_close_icon = "",
        close_icon = "",
        always_show_bufferline = false,
        indicator = {
          style = "none",
        },
        show_close_icon = false,
        separator_style = "thin",
      },
      highlights = {
        buffer_selected = {
          italic = false,
          bold = false,
          underline = false,
        },
      },
    }
  end,
}
