return {
    -- Render markdown/LaTeX/etc in buffer
    'OXY2DEV/markview.nvim',
    lazy = false,
    priority = 999,
    opts = {
        experimental = {
            check_rtp_message = false,
        },
        preview = {
            filetypes = { 'markdown', 'md', 'rmd' },
            modes = { 'n', 'no', 'c' },
        },
        markdown = {
            enable = true,
            list_items = {
                wrap = true,
                marker_minus = {
                    text = '•',
                },
            },
            tables = {
                parts = {
                    top = { '┌', '─', '┐', '┬' },
                    header = { '│', '│', '│' },
                    separator = { '├', '─', '┤', '┼' },
                    row = { '│', '│', '│' },
                    bottom = { '└', '─', '┘', '┴' },

                    overlap = { '┝', '━', '┥', '┿' },

                    align_left = '╼',
                    align_right = '╾',
                    align_center = { '╴', '╶' },
                },
            },
            latex = { enabled = false },
        },
    },
}
