return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "configs.cmp" -- ⟵ use our override
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local opts = require "nvchad.configs.nvimtree"

      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("NvimTreeCloseOnQuit", { clear = true }),
        callback = function()
          local layout = vim.api.nvim_list_wins()
          if #layout == 1 then
            local bufname = vim.api.nvim_buf_get_name(0)
            if bufname:match "NvimTree_" then
              vim.cmd "quit"
            end
          end
        end,
      })

      return opts
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    config = function()
      require("supermaven-nvim").setup {
        disable_keymaps = true, -- We'll handle Tab manually for perfect integration
      }
    end,
  },
}
