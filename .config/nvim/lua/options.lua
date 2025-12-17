local opt = vim.opt
local o = vim.o

o.laststatus = 3
o.splitkeep = "screen"
o.clipboard = "unnamedplus"

o.cursorline = true
o.cursorlineopt = "number"
o.termguicolors = true

o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }

o.ignorecase = true
o.smartcase = true

o.mouse = "a"

o.number = true
o.numberwidth = 2
o.ruler = false

o.scrolloff = 8

o.signcolumn = "yes"

o.splitbelow = true
o.splitright = true

o.timeoutlen = 400

o.undofile = true

o.updatetime = 250

o.swapfile = false
