return {
    -- Formatter
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'isort', 'black' },
            typst = { 'typstyle' },
        },
        default_format_opts = { lsp_format = 'fallback' },
        format_after_save = function(_)
            return {}, function(err, did_edit)
                if not err and did_edit then vim.cmd.write() end
            end
        end,
    },
}
