vim.g.mapleader = ','
vim.g.maplocalleader = '\\'
-- ew, get those tabs away from me
vim.o.expandtab = true 
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.number = true
-- avoid blinding yourself
vim.o.background = 'dark' 
-- file commands
vim.keymap.set('n', '<leader>q', ':q<cr>')
vim.keymap.set('n', '<leader>Q', ':q!<cr>')
vim.keymap.set('n', '<leader>W', ':w<cr>')
vim.keymap.set('n', '<leader>R', ':e!<cr>')
-- movement commands
vim.keymap.set('n', '<leader>w', '<C-W><up>')
vim.keymap.set('n', '<leader>a', '<C-W><left>')
vim.keymap.set('n', '<leader>s', '<C-W><down>')
vim.keymap.set('n', '<leader>d', '<C-W><right>')
-- tiling commands
vim.keymap.set('n', '<leader><up>', '<C-W>v')
vim.keymap.set('n', '<leader><left>', '<C-W>s')
vim.keymap.set('n', '<leader><down>', '<C-W>v')
vim.keymap.set('n', '<leader><right>', '<C-W>s')

require("config.lazy")
