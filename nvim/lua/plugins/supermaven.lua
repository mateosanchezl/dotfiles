return {
  "supermaven-inc/supermaven-nvim",
  lazy = false,
  config = function()
    require("supermaven-nvim").setup({
      disable_keymaps = true, -- We handle Tab manually for perfect integration
    })
  end,
}

