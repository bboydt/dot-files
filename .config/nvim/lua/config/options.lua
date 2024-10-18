vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

-- ew, get those tabs away from me
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = false

-- avoid blinding yourself
vim.opt.background = 'dark'

-- file types
vim.filetype.add({
    filename = {
        ["SConscript"] = "python",
    },
})
