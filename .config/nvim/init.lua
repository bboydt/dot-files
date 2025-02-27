-- Plugins
require "paq" {
    "savq/paq-nvim",
    "folke/tokyonight.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}

-- Theme
vim.cmd[[colorscheme tokyonight-night]]

-- Keybinds
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>F", "<cmd>Telescope fd<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep find_command=rg,--ignore,--hidden,--files<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")

vim.keymap.set("n", ",x", "<cmd>nohl<cr>")
vim.keymap.set("n", "<C-c>", "<cmd>norm gcc<cr>")
vim.keymap.set("v", "<C-c>", "<cmd>norm gcc<cr>")
vim.keymap.set("v", "<C-c>", "gc", { remap = true })

vim.keymap.set("n", "<leader>W", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>A", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>S", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>D", "<cmd>split<cr>")

vim.keymap.set("n", "<leader>w", "<C-W><up>")
vim.keymap.set("n", "<leader>a", "<C-W><left>")
vim.keymap.set("n", "<leader>s", "<C-W><down>")
vim.keymap.set("n", "<leader>d", "<C-W><right>")

vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "<leader>Q", "<cmd>q!<cr>")

-- Opts
vim.opt.shortmess:append("I")
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = false
vim.opt.background = "dark"

-- File Types
vim.filetype.add({
    filename = {
        ["SConscript"] = "python",
    },
    extension = {
        ["h"] = "c",
    },
})

-- Telescope
require "telescope".setup {
    defaults = {
        theme = "center",
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.4,
            },
        },
    },
}

-- Treesitter
require "nvim-treesitter.configs".setup {
    highlight = {
        enable = true,
    },
}
