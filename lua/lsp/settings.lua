local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        local oa_opts = { silent = true, buffer = event.buf }
        map('n', 'gd', vim.lsp.buf.definition, oa_opts)

        -- Enable inlay hints if possible
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
            return
        end

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            vim.lsp.inlay_hint.enable(true)
        end

        -- Format on save using lsp-format
        require("lsp-format").on_attach(client, event.buf)

        -- Enable word references highlighting if possible
        if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = augroup('word-lsp-highlight', { clear = false })
            autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            autocmd('LspDetach', {
                group = augroup('word-lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'word-lsp-highlight', buffer = event2.buf }
                end,
            })
        end
    end,
})

vim.diagnostic.config({
    -- Diagnostics virtual text is handled by tiny-inline-diagnostic.nvim
    virtual_text = false,
    update_in_insert = false,
    severety_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "󰋽",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        }
    }
})
