return {
    {
        -- Icons provider
        'echasnovski/mini.icons',
        lazy = true,
        -- Lazily mock devicons (snippet by folke)
        specs = { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
        opts = {
            file = {
                LICENSE         = { glyph = '' },
                ['LICENSE.md']  = { glyph = '' },
                ['LICENSE.txt'] = { glyph = '' },
                README          = { glyph = '󰭤' },
                ['README.md']   = { glyph = '󰭤' },
                ['README.txt']  = { glyph = '󰭤' },
            }
        }
    },

    {
        -- Scrollbar
        'petertriho/nvim-scrollbar',
        opts = {
            handle = {
                highlight = 'CursorLine',
            },
            excluded_filetypes = {
                'NvimTree',
                'noice',
            },
            handlers = {
                cursor = false
            }
        }
    },

    {
        -- General UI replacements
        "folke/noice.nvim",
        dependencies = "Muniftanjim/nui.nvim",
        opts = {
            cmdline = {
                view = "cmdline",
                format = {
                    cmdline = { pattern = "^:", icon = " ", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = " /", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ?", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = " $", lang = "bash" },
                    lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " 󰢱", lang = "lua" },
                    input = { view = "cmdline", icon = " " },
                    help = false,
                }
            },
            popupmenu = { enabled = false },
            commands = {
                errors = { view = "split" },
                last = { view = "split" },
            },
            lsp = {
                progress = {
                    format_done = {
                        { " ", hl_group = "NoiceLspProgressSpinner" },
                        { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
                        { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
                    }
                },
                signature = { enabled = false },
                hover = { enabled = false },
            },
            views = {
                popup = { border = { style = "none" } }
            },
            routes = {
                {
                    -- Pass delete and yank messages to mini view
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d fewer lines" },
                            { find = "%d more lines" },
                            { find = "%d lines <ed %d time[s]?" },
                            { find = "%d lines >ed %d time[s]?" },
                            { find = "%d lines yanked" },
                        }
                    },
                    view = "mini",
                },
                {
                    -- Disable lsp_signature.nvim error messages
                    -- which appear when rust-analyzer is loading
                    filter = {
                        event = "msg_show",
                        find = "lsp_signatur handler RPC"
                    },
                    opts = { skip = true }
                }
            }
        }
    },

    {
        -- Smooth scrolling in terminal nvim
        'karb94/neoscroll.nvim',
        cond = vim.g.neovide ~= true, -- Disable if using neovide
        keys = {
            { "<C-u>", function() require("neoscroll").ctrl_u({ duration = 100 }) end,                            mode = { 'n', 'v', 'x' } },
            { "<C-d>", function() require("neoscroll").ctrl_d({ duration = 100 }) end,                            mode = { 'n', 'v', 'x' } },
            { "<C-b>", function() require("neoscroll").ctrl_b({ duration = 100 }) end,                            mode = { 'n', 'v', 'x' } },
            { "<C-f>", function() require("neoscroll").ctrl_f({ duration = 100 }) end,                            mode = { 'n', 'v', 'x' } },
            { "<C-y>", function() require("neoscroll").scroll(-0.1, { move_cursor = false, duration = 100 }) end, mode = { 'n', 'v', 'x' } },
            { "<C-e>", function() require("neoscroll").scroll(0.1, { move_cursor = false, duration = 100 }) end,  mode = { 'n', 'v', 'x' } },
            { "zt",    function() require("neoscroll").zt({ half_win_duration = 150 }) end,                       mode = { 'n', 'v', 'x' } },
            { "zz",    function() require("neoscroll").zz({ half_win_duration = 150 }) end,                       mode = { 'n', 'v', 'x' } },
            { "zb",    function() require("neoscroll").zb({ half_win_duration = 150 }) end,                       mode = { 'n', 'v', 'x' } },
        },
        opts = {
            hide_cursor = false,
            easing_function = "circular",
            mappings = {} -- Disable default mappings as we define custom in keys
        }
    },

    {
        -- Highlight todo comments
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        opts = {
            signs = false,
            keywords = {
                FIX  = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = "󰅒 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            },
        }
    },

    {
        -- Highlight color codes
        'catgoose/nvim-colorizer.lua',
        event = "VeryLazy",
        opts = {
            user_default_options = {
                names = false,
                mode = "virtualtext",
                virtualtext = "",
                virtualtext_inline = true,
            },
            css = { css = true }
        }
    },

    {
        -- Dashboard from snacks
        "folke/snacks.nvim",
        opts = {
            dashboard = {
                preset = {
                    keys = {
                        { key = "n", icon = " ", desc = "New file", action = ":enew" },
                        { key = "f", icon = " ", desc = "Find file", action = ":Telescope find_files" },
                        { key = "r", icon = "󱋢 ", desc = "Recent files", action = ":Telescope oldfiles" },
                        { key = "d", icon = " ", desc = "Browse files", action = ":Telescope file_browser" },
                        { key = "p", icon = " ", desc = "Open project", action = ":Telescope projects" },
                        {
                            key = "z",
                            icon = " ",
                            desc = "Jump to directory",
                            action = function()
                                require("telescope").extensions.zoxide.list()
                            end
                        },
                        {
                            key = "l",
                            icon = " ",
                            desc = "Load last session",
                            action = function()
                                require("persistence").load { last = true }
                            end
                        },
                        { key = "q", icon = " ", desc = "Quit", action = ":qa!" },
                    },
                },
                formats = {
                    desc = { "%s", hl = "Comment" },
                    key = { "%s ", hl = "lualine_b_visual" },
                    icon = { "%s", hl = "Comment" }
                },
                sections = {
                    -- {
                    --     section = "terminal",
                    --     cmd = "chafa ~/.config/nvim/assets/splash.jpeg -f symbols --symbols vhalf -s 37x12 --stretch; sleep .1",
                    --     height = 12,
                    --     width = 37,
                    --     padding = 1,
                    --     align = "center",
                    --     indent = 12
                    -- },
                    {
                        section = "keys",
                        gap = 1,
                        padding = 1
                    }
                }
            },
            notifier = {
                style = "minimal",
                icons = {
                    error = " ",
                    warn = " ",
                    info = "󰋽 ",
                    debug = " ",
                    trace = " ",
                },
            }
        }
    },

    {
        -- Prettier quickfix window
        "yorickpeterse/nvim-pqf",
        main = "pqf",
        opts = {}
    }
}
