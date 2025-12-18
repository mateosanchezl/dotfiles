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
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "",
            highlight = "Directory",
            separator = true,
          },
        },
        buffer_close_icon = "",
        always_show_bufferline = false,
        indicator = {
          style = "none",
        },
        separator_style = "thin",
      },
      highlights = {
        buffer_selected = {
          italic = false,
          bold = false,
          underline = false,
        },
        diagnostic_selected = {
          italic = false,
          bold = false,
        },
        hint_selected = {
          italic = false,
          bold = false,
        },
        hint_diagnostic_selected = {
          italic = false,
          bold = false,
        },
        info_selected = {
          italic = false,
          bold = false,
        },
        info_diagnostic_selected = {
          italic = false,
          bold = false,
        },
        warning_selected = {
          italic = false,
          bold = false,
        },
        warning_diagnostic_selected = {
          italic = false,
          bold = false,
        },
        error_selected = {
          italic = false,
          bold = false,
        },
        error_diagnostic_selected = {
          italic = false,
          bold = false,
        },
      },
    }
  end,
}
