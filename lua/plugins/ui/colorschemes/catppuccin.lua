return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    ---@type CatppuccinOptions
    opts = {
        flavour = 'mocha',
        integrations = {
            leap = true,
            which_key = true,
            telescope = false,
            lsp_trouble = true,
            symbols_outline = true,
            nvim_surround = true,
            dap = true,
            dap_ui = true,
            native_lsp = {
                enabled = true,
                underlines = {
                    errors = { 'undercurl' },
                    hints = { 'undercurl' },
                    warnings = { 'undercurl' },
                    information = { 'undercurl' },
                },
            },
        },
        custom_highlights = function(colors)
            return {
                -- Atom-like blink.cmp highlights
                BlinkCmpKindSnippet = { fg = colors.base, bg = colors.flamingo },
                BlinkCmpKindKeyword = { fg = colors.base, bg = colors.mauve },
                BlinkCmpKindText = { fg = colors.base, bg = colors.flamingo },
                BlinkCmpKindMethod = { fg = colors.base, bg = colors.blue },
                BlinkCmpKindConstructor = { fg = colors.base, bg = colors.blue },
                BlinkCmpKindFunction = { fg = colors.base, bg = colors.blue },
                BlinkCmpKindFolder = { fg = colors.base, bg = colors.sapphire },
                BlinkCmpKindFile = { fg = colors.base, bg = colors.sapphire },
                BlinkCmpKindModule = { fg = colors.base, bg = colors.sapphire },
                BlinkCmpKindConstant = { fg = colors.base, bg = colors.peach },
                BlinkCmpKindField = { fg = colors.base, bg = colors.green },
                BlinkCmpKindProperty = { fg = colors.base, bg = colors.green },
                BlinkCmpKindEnum = { fg = colors.base, bg = colors.yellow },
                BlinkCmpKindEnumMember = { fg = colors.base, bg = colors.peach },
                BlinkCmpKindUnit = { fg = colors.base, bg = colors.sky },
                BlinkCmpKindClass = { fg = colors.base, bg = colors.yellow },
                BlinkCmpKindStruct = { fg = colors.base, bg = colors.yellow },
                BlinkCmpKindInterface = { fg = colors.base, bg = colors.yellow },
                BlinkCmpKindVariable = { fg = colors.base, bg = colors.maroon },
                BlinkCmpKindColor = { fg = colors.base, bg = colors.red },
                BlinkCmpKindReference = { fg = colors.base, bg = colors.red },
                BlinkCmpKindValue = { fg = colors.base, bg = colors.peach },
                BlinkCmpKindEvent = { fg = colors.base, bg = colors.red },
                BlinkCmpKindOperator = { fg = colors.base, bg = colors.teal },
                BlinkCmpKindTypeParameter = { fg = colors.base, bg = colors.sky },
                BlinkCmpKindCopilot = { fg = colors.base, bg = colors.teal },

                Cursor = { bg = colors.lavender },
                CursorIM = { bg = colors.lavender },

                ModeMsg = { fg = colors.green },
                TreesitterContextBottom = { style = {} }, -- Disable ugly ahh underline
            }
        end,
    },
    config = function(_, opts)
        require('catppuccin').setup(opts)
        vim.cmd.colorscheme('catppuccin')
    end,
}
