return {
    {
        -- LSP client configurations
        'neovim/nvim-lspconfig',
        lazy = false,
    },

    {
        -- External tooling installer
        "mason-org/mason.nvim",
        lazy = false,
        opts = {}
    },

    {
        -- Function arguments floating window
        'ray-x/lsp_signature.nvim',
        event = "InsertEnter",
        opts = {
            hint_enable = false,
            handler_opts = {
                border = "none"
            }
        }
    },

    {
        -- Improved virtual text diagnostic messages
        "rachartier/tiny-inline-diagnostic.nvim",
        opts = {
            preset = "simple",
            options = {
                multilines = {
                    enabled = true
                },
            }
        }
    },

    {
        -- Show bulb icon when code action is available
        'kosayoda/nvim-lightbulb',
        event = "LspAttach",
        opts = {
            sign = { enabled = false, },
            virtual_text = { enabled = true, text = '', hl_mode = 'replace', },
            autocmd = {
                enabled = true,
                updatetime = -1, -- Disable setting updatetime
            }
        },
    },

    {
        -- Tree-like view for symbols
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen" },
        opts = {
            outline_window = {
                width = 33,
                auto_jump = true,
            },
            symbols = {
                icons = {
                    -- TODO: Move kind icons into separate module
                    File = { icon = "", hl = "@text.uri" },
                    Module = { icon = "", hl = "@namespace" },
                    Namespace = { icon = "", hl = "@namespace" },
                    Package = { icon = "", hl = "@namespace" },
                    Class = { icon = "", hl = "@type" },
                    Method = { icon = "", hl = "@method" },
                    Property = { icon = "", hl = "@method" },
                    Field = { icon = "", hl = "@field" },
                    Constructor = { icon = "", hl = "@constructor" },
                    Enum = { icon = "", hl = "@type" },
                    Interface = { icon = "", hl = "@type" },
                    Function = { icon = "", hl = "@function" },
                    Variable = { icon = "", hl = "@constant" },
                    Constant = { icon = "", hl = "@constant" },
                    String = { icon = "", hl = "@string" },
                    Number = { icon = "", hl = "@number" },
                    Boolean = { icon = "", hl = "@boolean" },
                    Array = { icon = "", hl = "@constant" },
                    Object = { icon = "⦿", hl = "@type" },
                    Key = { icon = "", hl = "@type" },
                    Null = { icon = "", hl = "@type" },
                    EnumMember = { icon = "", hl = "@field" },
                    Struct = { icon = "", hl = "@type" },
                    Event = { icon = "", hl = "@type" },
                    Operator = { icon = "", hl = "@operator" },
                    TypeParameter = { icon = "", hl = "@parameter" },
                    Component = { icon = "󰅴", hl = "@function" },
                    Fragment = { icon = "󰅴", hl = "@constant" },
                }
            }
        }
    },

    {
        -- Code diagnostics window
        'folke/trouble.nvim',
        cmd = 'Trouble',
        opts = {
            use_diagnostic_signs = true,
        }
    },

    -- JSON schemas catalog
    "b0o/schemastore.nvim",

    {
        -- LuaLS config for Neovim
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim",        words = { "Snacks" } },
            },
        },
    }
}
