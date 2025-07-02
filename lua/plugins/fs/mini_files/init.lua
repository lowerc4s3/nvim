return {
    -- Editable file manager with column view
    'echasnovski/mini.files',
    opts = {
        mappings = {
            go_in = 'L',
            go_in_plus = 'l',
        },
        -- Configure extension
        ---@type mini.files.ext.Config
        ext = {
            mappings = {
                cd = 'gd',
                open = 'gx',
                copy_path = 'gy',
                open_split = '<C-S>',
                open_vsplit = '<C-V>',
            },
        },
        windows = {
            preview = true,
            width_preview = 50,
        },
    },
    config = function(_, opts)
        require('mini.files').setup(opts)
        require('plugins.fs.mini_files.ext').setup(opts.ext)
        vim.api.nvim_create_autocmd('User', {
            pattern = 'MiniFilesBufferCreate',
            callback = function(event)
                require('which-key').add {
                    {
                        '<leader>s',
                        MiniFiles.synchronize,
                        icon = '',
                        desc = 'Apply changes',
                        buffer = event.data.buf_id,
                    },
                }
            end,
        })
    end,
}
