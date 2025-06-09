return {
    -- Dashboard from snacks
    'folke/snacks.nvim',
    opts = {
        dashboard = {
            preset = {
                keys = {
                    { key = 'n', icon = ' ', desc = 'New file', action = ':enew' },
                    {
                        key = 'f',
                        icon = ' ',
                        desc = 'Find file',
                        action = ':Telescope find_files',
                    },
                    {
                        key = 'r',
                        icon = '󱋢 ',
                        desc = 'Recent files',
                        action = ':Telescope oldfiles',
                    },
                    {
                        key = 'd',
                        icon = ' ',
                        desc = 'Browse files',
                        action = ':Telescope file_browser',
                    },
                    {
                        key = 'p',
                        icon = ' ',
                        desc = 'Open project',
                        action = ':Telescope projects',
                    },
                    {
                        key = 'z',
                        icon = ' ',
                        desc = 'Jump to directory',
                        action = function() require('telescope').extensions.zoxide.list() end,
                    },
                    {
                        key = 'l',
                        icon = ' ',
                        desc = 'Load last session',
                        action = function() require('persistence').load { last = true } end,
                    },
                    { key = 'q', icon = ' ', desc = 'Quit', action = ':qa!' },
                },
            },
            formats = {
                desc = { '%s', hl = 'Comment' },
                key = { '%s ', hl = 'lualine_b_visual' },
                icon = { '%s', hl = 'Comment' },
            },
            sections = {
                -- BUG: Terminal section will show output with huge lag
                -- so it's disabled now (tracked by https://github.com/folke/snacks.nvim/issues/1769)
                -- {
                --     section = "terminal",
                --     cmd = "chafa ~/.config/nvim/assets/splash.jpeg -f symbols --symbols vhalf -s 37x12 --stretch; sleep .1",
                --     height = 12,
                --     width = 37,
                --     padding = 1,
                --     align = "center",
                --     indent = 12
                -- },
                {
                    section = 'keys',
                    gap = 1,
                    padding = 1,
                },
            },
        },
    },
}
