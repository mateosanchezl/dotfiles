-- return {
--   "rose-pine/neovim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("rose-pine").setup {
--       styles = {
--         italic = false,
--         transparency = true,
--         bold = false,
--       },
--     }
--
--     vim.cmd "colorscheme rose-pine"
--   end,
-- }
--
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("tokyonight").setup {
--       transparent = true,
--     }
--     vim.cmd "colorscheme tokyonight-night"
--   end,
-- }
--
-- return {
--   "catppuccin/nvim",
--   lazy = false,
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup {
--       flavour = "mocha",
--       no_italic = true,
--       no_bold = true,
--     }
--     vim.cmd "colorscheme catppuccin"
--   end,
-- }

return {
  "vague-theme/vague.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vague").setup {
      bold = false,
      italic = false,
    }
    vim.cmd "colorscheme vague"
  end,
}
