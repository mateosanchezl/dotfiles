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
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup {}
    vim.cmd "colorscheme tokyonight-night"
  end,
}
