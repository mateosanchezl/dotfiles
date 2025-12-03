return {
  "goolord/alpha-nvim",
  lazy = false,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "          __    __    __    __         ",
      "       8 /__////__////__////__////    ",
      "      7 ////__////__////__////__/    ",
      "     6 /__////__////__////__////     ",
      "    5 ////__////__////__////__/     ",
      "   4 /__////__////__////__////      ",
      "  3 ////__////__////__////__/       ",
      " 2 /__////__////__////__////        ",
      "1 ////__////__////__////__/         ",
      "   a  b  c  d  e  f  g  h           ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "   - find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "   - recent", ":Telescope oldfiles<CR>"),
    }

    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function()
        vim.opt_local.foldenable = false
      end,
    })
  end,
}

