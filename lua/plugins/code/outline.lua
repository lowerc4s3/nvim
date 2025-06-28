return {
    -- Tree-like view for symbols
    'hedyhli/outline.nvim',
    cmd = { 'Outline', 'OutlineOpen' },
    opts = {
        outline_window = {
            position = 'left',
            width = 30,
            relative_width = false,
            auto_jump = true,
            winhl = 'Normal:NormalFloat,WinSeparator:NeoTreeWinSeparator',
        },
        outline_items = {
            show_symbol_details = false,
        },
        symbols = {
            icon_fetcher = function(kind, _, _)
                local icon, _, _ = MiniIcons.get('lsp', kind)
                return icon
            end,
            icons = {
                File = { hl = '@text.uri' },
                Module = { hl = '@namespace' },
                Namespace = { hl = '@namespace' },
                Package = { hl = '@namespace' },
                Class = { hl = '@type' },
                Method = { hl = '@method' },
                Property = { hl = '@method' },
                Field = { hl = '@field' },
                Constructor = { hl = '@constructor' },
                Enum = { hl = '@type' },
                Interface = { hl = '@type' },
                Function = { hl = '@function' },
                Variable = { hl = '@constant' },
                Constant = { hl = '@constant' },
                String = { hl = '@string' },
                Number = { hl = '@number' },
                Boolean = { hl = '@boolean' },
                Array = { hl = '@constant' },
                Object = { hl = '@type' },
                Key = { hl = '@type' },
                Null = { hl = '@type' },
                EnumMember = { hl = '@field' },
                Struct = { hl = '@type' },
                Event = { hl = '@type' },
                Operator = { hl = '@operator' },
                TypeParameter = { hl = '@parameter' },
                Component = { hl = '@function' },
                Fragment = { hl = '@constant' },
            },
        },
    },
}
