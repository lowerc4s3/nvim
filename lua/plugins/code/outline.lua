return {
    -- Tree-like view for symbols
    'hedyhli/outline.nvim',
    cmd = { 'Outline', 'OutlineOpen' },
    opts = {
        outline_window = {
            width = 33,
            auto_jump = true,
        },
        symbols = {
            icons = {
                -- TODO: Move kind icons into separate module
                File = { icon = '', hl = '@text.uri' },
                Module = { icon = '', hl = '@namespace' },
                Namespace = { icon = '', hl = '@namespace' },
                Package = { icon = '', hl = '@namespace' },
                Class = { icon = '', hl = '@type' },
                Method = { icon = '', hl = '@method' },
                Property = { icon = '', hl = '@method' },
                Field = { icon = '', hl = '@field' },
                Constructor = { icon = '', hl = '@constructor' },
                Enum = { icon = '', hl = '@type' },
                Interface = { icon = '', hl = '@type' },
                Function = { icon = '', hl = '@function' },
                Variable = { icon = '', hl = '@constant' },
                Constant = { icon = '', hl = '@constant' },
                String = { icon = '', hl = '@string' },
                Number = { icon = '', hl = '@number' },
                Boolean = { icon = '', hl = '@boolean' },
                Array = { icon = '', hl = '@constant' },
                Object = { icon = '⦿', hl = '@type' },
                Key = { icon = '', hl = '@type' },
                Null = { icon = '', hl = '@type' },
                EnumMember = { icon = '', hl = '@field' },
                Struct = { icon = '', hl = '@type' },
                Event = { icon = '', hl = '@type' },
                Operator = { icon = '', hl = '@operator' },
                TypeParameter = { icon = '', hl = '@parameter' },
                Component = { icon = '󰅴', hl = '@function' },
                Fragment = { icon = '󰅴', hl = '@constant' },
            },
        },
    },
}
