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

-- return {
--   "catppuccin/nvim",
--   lazy = false,
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup {
--       flavour = "macchiato",
--       no_italic = true,
--     }
--     vim.cmd "colorscheme catppuccin"
--   end,
-- }
--
-- return {
--   "vague-theme/vague.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("vague").setup {
--       bold = false,
--       italic = false,
--     }
--     vim.cmd "colorscheme vague"
--   end,
-- }
--
-- return {
--   "ellisonleao/gruvbox.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup({
--       italic = {
--         strings = false,
--         emphasis = false,
--         comments = false,
--         operators = false,
--         folds = false,
--       },
--     })
--     vim.cmd("colorscheme gruvbox")
--   end,
-- }
return {
  "ribru17/bamboo.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("bamboo").setup {
      -- optional configuration here
    }
    require("bamboo").load()
    vim.cmd "colorscheme bamboo"
  end,
}
