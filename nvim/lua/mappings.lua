require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

map("i", "<Tab>", function()
  local suggestion = require "supermaven-nvim.completion_preview"
  local luasnip = require "luasnip"

  if suggestion.has_suggestion() then
    suggestion.on_accept_suggestion()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif vim.fn.pumvisible() == 1 then -- if cmp menu is open
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
  end
end, { desc = "Supermaven → LuaSnip → cmp → Tab" })
