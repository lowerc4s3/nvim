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
                        action = function() MiniFiles.open() end,
                    },
                    {
                        key = 'p',
                        icon = ' ',
                        desc = 'Open project',
                        action = ':Telescope projects',
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
                -- NOTE: Some commands might show with huge lag,
                -- maybe this happens if the program tries to probe terminal,
                -- check here https://github.com/folke/snacks.nvim/issues/1769
                {
                    section = 'terminal',
                    cmd = 'chafa ~/.config/nvim/assets/splash.jpeg --probe off -f symbols --symbols vhalf -s 37x12 --stretch; sleep .1',
                    height = 12,
                    width = 37,
                    padding = 1,
                    align = 'center',
                    indent = 12,
                },
                {
                    section = 'keys',
                    gap = 1,
                    padding = 1,
                },
            },
        },
    },
}
