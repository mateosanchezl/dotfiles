local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- General Options ------------------------------------------

-- Global statusline
o.laststatus = 3
o.showmode = false
o.splitkeep = "screen"

-- Clipboard
o.clipboard = "unnamedplus"

-- Cursor
o.cursorline = true
o.cursorlineopt = "number"
o.termguicolors = true

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- Fill characters
opt.fillchars = { eob = " " }

-- Search
o.ignorecase = true
o.smartcase = true

-- Mouse
o.mouse = "a"

-- Line numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- Scroll offset (your customization)
o.scrolloff = 8

-- Disable nvim intro
opt.shortmess:append "sI"

-- Sign column
o.signcolumn = "yes"

-- Splits
o.splitbelow = true
o.splitright = true

-- Timeouts
o.timeoutlen = 400

-- Undo
o.undofile = true

-- Update time (for gitsigns and swap file)
o.updatetime = 250

-- Line wrapping behavior
opt.whichwrap:append "<>[]hl"

-------------------------------------- Disable Providers ------------------------------------------

g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-------------------------------------- Mason Path ------------------------------------------

-- Add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH
