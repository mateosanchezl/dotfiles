return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.70,
        },
        width = 0.90,
        height = 0.85,
      },
      mappings = {
        n = { ["q"] = require("telescope.actions").close },
      },
    },
  },
}
