vim.g.mapleader = ','
vim.g.maplocalleader = '\\'
vim.o.expandtab = true -- ew, get those tabs away from me
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.number = true
vim.o.background = 'dark' -- avoid blinding yourself

require("config.lazy")
