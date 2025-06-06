return {
    -- File manager
    "echasnovski/mini.files",
    opts = {
        mappings = {
            go_in = 'L',
            go_in_plus = 'l',
        }
    },
    config = function(_, opts)
        require("mini.files").setup(opts)
        -- Sync file changes on :w
        vim.api.nvim_create_autocmd('User', {
            pattern = 'MiniFilesBufferCreate',
            callback = function(ev)
                vim.schedule(function()
                    vim.bo.buftype = "acwrite"
                    vim.api.nvim_buf_set_name(0, tostring(vim.api.nvim_get_current_win()))
                    vim.api.nvim_create_autocmd('BufWriteCmd', {
                        buffer = ev.data.buf_id,
                        callback = function()
                            require('mini.files').synchronize()
                        end,
                    })
                end)
            end,
        })
    end
}
