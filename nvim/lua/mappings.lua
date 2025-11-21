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

-- Terminal mode mappings for easy switching
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Terminal navigation that auto-enters insert mode if landing on terminal
local function term_nav(direction)
  return function()
    -- Exit terminal mode first
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
    -- Move to the window
    vim.cmd("wincmd " .. direction)
    -- Check if we're in a terminal and enter insert mode
    vim.schedule(function()
      if vim.bo.buftype == "terminal" then
        vim.cmd("startinsert")
      end
    end)
  end
end

map("t", "<C-h>", term_nav("h"), { desc = "Go to left window" })
map("t", "<C-j>", term_nav("j"), { desc = "Go to bottom window" })
map("t", "<C-k>", term_nav("k"), { desc = "Go to top window" })
map("t", "<C-l>", term_nav("l"), { desc = "Go to right window" })
