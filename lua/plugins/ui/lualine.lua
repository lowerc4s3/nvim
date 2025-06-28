return {
    -- Status line
    'nvim-lualine/lualine.nvim',
    opts = function()
        local mode = {
            'mode',
            fmt = function(str) return str:sub(1, 3) end,
        }

        local searchcount = {
            'searchcount',
            padding = { left = 0, right = 1 },
        }

        local selectioncount = {
            'selectioncount',
            icon = '󰫙',
            padding = { left = 0, right = 1 },
        }

        local branch = {
            'branch',
            icon = '',
        }

        local diff = {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            padding = { left = 0, right = 1 },
        }

        local basename = {
            function()
                local path = vim.fn.expand('%:h')
                if path == '.' or path == '' then
                    return ''
                else
                    return path .. '/'
                end
            end,
            padding = { left = 1, right = 0 },
            fmt = function(str) return str:gsub('/', '  '):gsub('%s+$', '') end,
            color = 'NonText',
        }

        local filetype = {
            'filetype',
            padding = { left = 1, right = 0 },
            icon_only = true,
        }

        local filename = {
            'filename',
            padding = 0,
            path = 0,
            symbols = {
                unnamed = '',
                newfile = '',
            },
            file_status = false,
        }

        local filestatus = {
            function()
                if vim.bo.modified then
                    return '●'
                elseif not vim.bo.modifiable or vim.bo.readonly then
                    return ''
                end
                return ''
            end,
            padding = 1,
            color = 'MiniIconsGreen',
        }

        local diagnostics = {
            'diagnostics',
            update_in_insert = false,
            symbols = { error = ' ', warn = ' ', hint = ' ', info = '󰋽 ' },
        }

        local encoding = {
            'encoding',
            fmt = function(str) return string.upper(str) end,
            padding = { left = 1, right = 0 },
        }

        local tabsize = {
            function()
                local type = vim.bo.expandtab and 'SPC' or 'TAB'
                local size = vim.bo.expandtab and vim.bo.shiftwidth or vim.bo.tabstop
                return type .. ':' .. size
            end,
            padding = { left = 1, right = 0 },
            cond = function() return vim.bo.filetype ~= '' end,
        }

        local fileformat = {
            'fileformat',
            padding = 1,
            symbols = { unix = 'LF', dos = 'CRLF', mac = 'CR' },
        }

        local progress = {
            '%P',
            icon = '󰍜',
            padding = { left = 1, right = 0 },
        }

        local showmode = {
            require('noice').api.status.mode.get,
            cond = require('noice').api.status.mode.has,
            color = 'NoiceVirtualText',
        }

        return {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {},
                always_divide_middle = true,
                globalstatus = true,
            },

            sections = {
                lualine_a = { mode, searchcount, selectioncount },
                lualine_b = { branch, diff },
                lualine_c = { basename, filetype, filename, filestatus },
                lualine_x = { diagnostics, showmode },
                lualine_y = { tabsize, encoding, fileformat },
                lualine_z = { progress, 'location' },
            },

            tabline = {},
            -- extensions = { 'nvim-dap-ui', 'toggleterm', 'trouble' },
            extensions = { 'nvim-dap-ui', 'toggleterm', 'man', 'quickfix' },
        }
    end,
}
