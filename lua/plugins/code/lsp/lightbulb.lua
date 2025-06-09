return {
    -- Show bulb icon when code action is available
    'kosayoda/nvim-lightbulb',
    event = 'LspAttach',
    opts = {
        sign = { enabled = false },
        virtual_text = { enabled = true, text = '', hl_mode = 'replace' },
        autocmd = {
            enabled = true,
            updatetime = -1, -- Disable setting updatetime
        },
    },
}
