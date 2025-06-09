return {
    -- Formatter
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'isort', 'black' },
        },
        default_format_opts = { lsp_format = 'fallback' },
    },
}
