return {
    -- File manager
    "echasnovski/mini.files",
    opts = {
        mappings = {
            go_in = 'L',
            go_in_plus = 'l',
        },
        -- Configure extension
        ---@type mini.files.ext.Config
        ext = {
            mappings = {
                open = "gx",
                copy_path = "gy",
            }
        },
        windows = {
            preview = true,
        }
    },
    config = function(_, opts)
        require("mini.files").setup(opts)
        require("plugins.fs.mini_files.ext").setup(opts.ext)
        vim.api.nvim_create_autocmd("User", {
            pattern = "MiniFilesBufferCreate",
            callback = function(event)
                require("which-key").add {
                    { "<leader>s", MiniFiles.synchronize, icon = "", desc = "Apply changes", buffer = event.data.buf_id }
                }
            end
        })
    end
}
