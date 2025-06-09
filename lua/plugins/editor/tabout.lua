return {
    -- Skip quotes and parentheses with tab
    'abecodes/tabout.nvim',
    event = { 'InsertEnter', 'CmdLineEnter' },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'saghen/blink.cmp',
    },
    priority = 999,
    opts = {
        tabouts = {
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = '`', close = '`' },
            { open = '(', close = ')' },
            { open = '[', close = ']' },
            { open = '{', close = '}' },
            { open = '<', close = '>' },
        },
    },
}
