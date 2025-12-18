local map = vim.keymap.set

map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })
map("n", "<C-a>", "<cmd>%y+<CR>", { desc = "Copy whole file" })

map({ "n", "x" }, "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format file" })

-- (no longer needed with trouble.nvim)
-- map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

map("n", "<tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close buffer" })

map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

map("n", "<leader>e", "<cmd>Neotree toggle position=float<cr>", { desc = "Toggle nvim-tree" })

map(
  "n",
  "<leader>gb",
  "<cmd>Neotree git_status toggle<cr>",
  { desc = "Toggle Neo-tree Git Status" }
)

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Find all files" }
)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map(
  "n",
  "<leader>fw",
  "<cmd>Telescope current_buffer_fuzzy_find<CR>",
  { desc = "Find in current buffer" }
)

map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Git status" })

map("n", "<leader>wK", "<cmd>WhichKey<CR>", { desc = "WhichKey all keymaps" })
map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "WhichKey query lookup" })

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
map(
  "n",
  "<leader>cs",
  "<cmd>Trouble symbols toggle focus=false<CR>",
  { desc = "Symbols (Trouble)" }
)
map(
  "n",
  "<leader>cl",
  "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
  { desc = "LSP Definitions/references (Trouble)" }
)

map("i", "<Tab>", function()
  local has_supermaven, supermaven = pcall(require, "supermaven-nvim.completion_preview")
  local has_luasnip, luasnip = pcall(require, "luasnip")

  if has_supermaven and supermaven.has_suggestion() then
    supermaven.on_accept_suggestion()
  elseif has_luasnip and luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif vim.fn.pumvisible() == 1 then
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
  end
end, { desc = "Supermaven → LuaSnip → cmp → Tab" })
