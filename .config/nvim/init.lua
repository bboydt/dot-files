-- Plugins
require "paq" {
    "folke/tokyonight.nvim",
    "lukas-reineke/virt-column.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "savq/paq-nvim",
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

vim.keymap.set("n", "\t", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<S-\t>", "<cmd>tabprev<cr>")
vim.keymap.set("n", "=", "<cmd>tabnext<cr>")
vim.keymap.set("n", "-", "<cmd>tabprev<cr>")
vim.keymap.set("n", "<leader>t", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<C-q>", "<cmd>tabclose<cr>")

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

-- Cursor Line Highlight
local augroup = vim.api.nvim_create_augroup(
    "HighlightCurrentLine",
    { clear = true }
)

vim.api.nvim_create_autocmd("WinEnter", {
    group = augroup,
    callback = function()
        vim.wo.cursorline = true
    end
})

vim.api.nvim_create_autocmd("WinLeave", {
    group = augroup,
    callback = function()
        vim.wo.cursorline = false
    end
})


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

-- Virt column
require "virt-column".setup()
require "virt-column".update {
    enabled = true,
    char = ":",
    virtcolumn = "81",
    highlight = "Whitespace",
}

-- Trailing Whitespace
vim.opt.listchars = {
    trail = "·",
    tab = "--",
}
vim.opt.list = true
vim.cmd([[match TrailingWhitespace /\s\+$/]])
vim.api.nvim_set_hl(0, "TrailingWhitespace", { fg = "#542931" })
