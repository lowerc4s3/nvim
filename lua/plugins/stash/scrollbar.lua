return {
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
            cursor = false,
        },
    },
}
