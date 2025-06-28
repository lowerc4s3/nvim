return {
    -- Floating winbars
    'b0o/incline.nvim',
    opts = {
        window = {
            margin = {
                horizontal = 0,
                vertical = 0,
            },
            padding = 0,
        },
        hide = {
            only_win = true,
        },
        render = function(props)
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
            if filename == '' then filename = '[No Name]' end
            local modified = vim.bo[props.buf].modified
            local icon, hl, _ = require('mini.icons').get('filetype', vim.bo[props.buf].filetype)
            local bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(hl)), 'fg', 'gui')
            local fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('Normal')), 'bg', 'gui')
            return {
                { ' ', icon, ' ', guibg = bg, guifg = fg },
                ' ',
                { filename, group = 'NormalFloat' },
                ' ',
                modified and { '● ', group = 'MiniIconsGreen' } or '',
            }
        end,
    },
}
