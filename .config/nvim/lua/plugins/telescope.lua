return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  cmd = "Telescope",
  opts = {
    defaults = {
      color_devicons = false,
      prompt_prefix = " ",
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "descending",
      path_display = { "truncate" },
      layout_config = {
        horizontal = {
          prompt_position = "bottom",
          preview_width = 0.70,
        },
        width = 0.95,
        height = 0.95,
      },
      mappings = {
        n = { ["q"] = require("telescope.actions").close },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  },
  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)
    telescope.load_extension "fzf"
  end,
}
