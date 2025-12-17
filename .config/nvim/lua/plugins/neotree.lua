return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    filesystem = {
      filtered_items = {
        hide_ignored = false,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = {
        enabled = true,
      },
      toggle = true,
    },
    window = {
      popup = {
        border = "rounded",
      },
    },
  },
}
