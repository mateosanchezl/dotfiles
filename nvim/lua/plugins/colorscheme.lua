return {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup {
      styles = {
        italic = false,
        transparency = true,
        bold = false,
      },
    }

    vim.cmd "colorscheme rose-pine"
  end,
}
