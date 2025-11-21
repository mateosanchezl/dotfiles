local cmp = require "cmp"
local defaults = require "nvchad.configs.cmp"
local luasnip = require "luasnip"

local has_supermaven, supermaven = pcall(require, "supermaven-nvim.completion_preview")

local options = vim.tbl_deep_extend("force", defaults, {
  completion = { completeopt = "menu,menuone,noinsert,noselect" },

  mapping = cmp.mapping.preset.insert {
    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },

    ["<CR>"] = cmp.mapping.confirm { select = false }, -- Enter only confirms if item explicitly chosen

    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if has_supermaven and supermaven.has_suggestion() then
        supermaven.on_accept_suggestion()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
  },
})

return options
