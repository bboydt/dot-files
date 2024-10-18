local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd([[colorscheme tokyonight-night]])
            end,
        },

        {
            "nvim-neo-tree/neo-tree.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            },
            keys = {
                { "<leader>n", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
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
            },
        },

        {
            "johnfrankmorgan/whitespace.nvim",
            opts = {
                highlight = "DiffDelete",
                ignored_filetypes = {
                    "TelescopePrompt",
                    "Trouble",
                    "dashboard",
                    "help",
                    "lazy",
                    "neo-tree",
                },
                ignore_terminal = true,
                return_cursor = true,
            },
        },

        {
            "nvim-telescope/telescope.nvim",
            opts = {
                pickers = {
                    colorscheme = {
                        enable_preview = true
                    }
                }
            },
            keys = {
                { "<leader>fg", "<cmd>Telescope live_grep_args find_command=rg,--ignore,--hidden,--files<cr>" },
            },
            config = function()
                local telescope = require("telescope")
                telescope.setup({
                })
                telescope.load_extension("live_grep_args")
            end
        },

        { "nvim-lua/plenary.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },

        { "nvim-telescope/telescope-live-grep-args.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },

        {
            "nvim-telescope/telescope-fzf-native.nvim",
            dependencies = { "nvim-telescope/telescope.nvim" },
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release" ,
        },

        {
            "nvim-treesitter/nvim-treesitter",
            lazy = false,
            version = "v0.23.0",
            config = function()
                local treesitter = require("nvim-treesitter.configs")
                treesitter.setup({
                    ensure_installed = { "c", "lua", "python", "vimdoc", "query" },
                    sync_install = false,
                    auto_install = true,
                    highlight = {
                        enable = true,
                        disable = function(lang, buf)
                            local max_filesize = 100 * 1024
                            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                            if ok and stats and stats.size > max_filesize then
                                return true
                            end
                        end,
                        additional_vim_regex_highlighting = {"python"}
                    },
                })
            end,
        },
    },

    config = {
        defaults = {
            lazy = true,
        },
    },

    install = {
        colorscheme = { "tokyonight-night" }
    },

    checker = {
        enabled = false
    },

    ui = {
        icons = {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
