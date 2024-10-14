return {

    { 'duane9/nvim-rg' },

    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },

    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    {
        'johnfrankmorgan/whitespace.nvim',
        opts = {
            highlight = 'DiffDelete',
            ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help', 'dashboard', 'neo-tree' },
            ignore_terminal = true,
            return_cursor = true,
        },
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { '<leader>n', '<cmd>Neotree<cr>' },
        },
        opts = {
            default_component_configs = {
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "+",
                        deleted   = "X",
                        modified  = "*",
                        renamed   = "R",
                        -- Status type
                        untracked = "?",
                        ignored   = ";",
                        unstaged  = "!",
                        staged    = "",
                        conflict  = "m",
                    }
                }
            }
        }
    },

    {
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        event = 'VeryLazy',
        version = '2.*',
        config = function()
            require'window-picker'.setup()
        end,
    },

    -- telescope

    {
        'nvim-telescope/telescope.nvim',
        opts = {
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        },
        keys = {
            { '<leader>t', '<cmd>Telescope<cr>' },
            { '<leader>fg', '<cmd>Telescope live_grep_args find_command=rg,--ignore,--hidden,--files<cr>' },
        },
        config = function()
            local telescope = require('telescope')
            telescope.setup({
            })
            telescope.load_extension('live_grep_args')
        end
    },

    { 'nvim-lua/plenary.nvim', dependencies = { 'nvim-telescope/telescope.nvim' } },

    { 'nvim-telescope/telescope-live-grep-args.nvim', dependencies = { 'nvim-telescope/telescope.nvim' } },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' ,
    },

    -- treesitter

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        version = "v0.23.0",
        config = function()
            local treesitter = require('nvim-treesitter.configs')
            treesitter.setup({
                ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = {'python'}
                },
            })
        end,
    },

}
