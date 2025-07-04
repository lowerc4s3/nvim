return {
    -- Mappings with mappings cheatsheet (not so nested anymore)
    'folke/which-key.nvim',
    ---@class wk.Opts
    opts = {
        preset = 'classic',
        plugins = {
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = false,
                nav = false,
                z = true,
                g = true,
            },
        },

        -- Don't show translated mappings from langmapper
        filter = function(mapping)
            return mapping.desc and mapping.desc:find('wkignore', 1, true) ~= 1
        end,

        icons = {
            breadcrumb = '',
            separator = '│',
            group = '',
            rules = false,
        },

        layout = {
            width = { min = 20, max = 50 },
            spacing = 8,
        },

        show_keys = false,
        show_help = false,

        win = { no_overlap = false },

        -- stylua: ignore
        spec = {
            silent = true,
            { '<leader>s', '<cmd>write<CR>', icon = '', desc = 'Save' },
            { '<leader>S', '<cmd>wall<CR>', icon = '', desc = 'Save all' },
            { '<leader>x', function() Snacks.bufdelete() end, icon = '󰅘', desc = 'Close buffer' },
            { '<leader>X', function() Snacks.bufdelete { force = true } end, icon = '󰅗', desc = 'Force close buffer' },
            { '<leader>q', '<cmd>qa<CR>', icon = '', desc = 'Quit' },
            { '<leader>Q', '<cmd>qa!<CR>', icon = '', desc = 'Force quit' },
            { '<leader>.', function() MiniFiles.open() end, icon = '', desc = 'Browse files' },
            { '<leader><leader>', '<cmd>Telescope find_files<CR>', icon = '', desc = 'Find files' },

            { '<leader>b', group = 'Buffers', icon = '' },
            { '<leader>bf', '<cmd>Telescope buffers<CR>', icon = '', desc = 'Search' },
            { '<leader>bx', function() Snacks.bufdelete.all() end, icon = '󰱞', desc = 'Close all' },
            { '<leader>bx', function() Snacks.bufdelete.all { force = true } end, icon = '󰱝', desc = 'Force close all' },

            { '<leader>f', group = 'Find', icon = '' },
            { '<leader>ff', '<cmd>Telescope find_files<CR>', icon = '', desc = 'Files' },
            { '<leader>fr', '<cmd>Telescope oldfiles<CR>', icon = '󱋢', desc = 'Recent' },
            { '<leader>fb', '<cmd>Telescope buffers<CR>', icon = '', desc = 'Buffers' },
            { '<leader>fp', '<cmd>Telescope projects<CR>', icon = '', desc = 'Projects' },
            { '<leader>fw', '<cmd>Telescope live_grep<CR>', icon = '󰦨', desc = 'Text' },
            { '<leader>ft', '<cmd>TodoTelescope<CR>', icon = '', desc = 'Todos' },

            { '<leader>g', group = 'Git', icon = '󰊢' },
            { '<leader>gg', '<cmd>Neogit<CR>', icon = '󰊢', desc = 'Neogit' },
            { '<leader>gd', '<cmd>Neogit diff<CR>', icon = '', desc = 'Diff' },
            { '<leader>gl', '<cmd>Neogit log<CR>', icon = '', desc = 'Log' },
            { '<leader>gp', '<cmd>Neogit pull<CR>', icon = '', desc = 'Pull' },
            { '<leader>gP', '<cmd>Neogit push<CR>', icon = '', desc = 'Push' },
            { '<leader>gb', '<cmd>Neogit branch<CR>', icon = '', desc = 'Branch' },

            { '<leader>d', group = 'Debug', icon = '' },
            { '<leader>db', '<cmd>DapContinue<cr>', icon = '', desc = 'Start debugging' },
            { '<leader>dl', function() require('dap').run_last() end, icon = '', desc = 'Run last' },
            { '<leader>di', '<cmd>DapStepInto<cr>', icon = '', desc = 'Step into' },
            { '<leader>do', '<cmd>DapStepOver<cr>', icon = '', desc = 'Step over' },
            { '<leader>dO', '<cmd>DapStepOut<cr>', icon = '', desc = 'Step out' },
            { '<leader>ds', '<cmd>DapTerminate<cr>', icon = '', desc = 'Stop debugging' },

            { '<leader>c', group = 'Code', icon = '' },
            { '<leader>cD', vim.diagnostic.setqflist, icon = '', desc = 'Diagnostics (workspace)' },
            { '<leader>cd', vim.diagnostic.setloclist, icon = '', desc = 'Diagnostics' },
            { '<leader>cf', function() require("conform").format() end, icon = '', desc = 'Format' },
            { '<leader>co', '<cmd>Outline<CR>', icon = '', desc = 'Symbols outline' },
            { '<leader>cc', '<cmd>ColorizerToggle<cr>', icon = '', desc = 'Toggle colorizer' },
            { '<leader>cT', '<cmd>TodoQuickFix<CR>', icon = '', desc = 'Todos' },
            { '<leader>ct', group = 'Tasks', icon = '' },
            { '<leader>ctt', '<cmd>OverseerRun<cr>', icon = '', desc = 'Run' },
            { '<leader>cto', '<cmd>OverseerOpen<cr>', icon = '', desc = 'Open output' },

            { '<leader>p', group = 'Packages', icon = '' },
            { '<leader>pc', '<cmd>Lazy check<CR>', icon = '', desc = 'Check updates' },
            { '<leader>pC', '<cmd>Lazy clean<CR>', icon = '󰃢', desc = 'Clean' },
            { '<leader>ps', '<cmd>Lazy sync<CR>', icon = '', desc = 'Sync' },
            { '<leader>pi', '<cmd>Lazy install<CR>', icon = '', desc = 'Install' },
            { '<leader>pl', '<cmd>Lazy log<CR>', icon = '', desc = 'Log' },
            { '<leader>pp', '<cmd>Lazy<CR>', icon = '', desc = 'Show' },
            { '<leader>pm', '<cmd>Mason<CR>', icon = '', desc = 'Mason' },

            { '<leader>w', group = 'Window', icon = '' },
            { '<leader>ws', '<C-w>s', icon = '', desc = 'Horizontal split' },
            { '<leader>wv', '<C-w>v', icon = '', desc = 'Vertical split' },
            { '<leader>wc', '<C-w>c', icon = '󰖭', desc = 'Close' },
            { '<leader>wb', '<C-w>=', icon = '󰇼', desc = 'Balance' },

            { '<leader>n', group = 'Notifications', icon = '' },
            { '<leader>nn', '<cmd>Noice history<cr>', icon = '', desc = 'Show' },
            { '<leader>na', '<cmd>Noice all<cr>', icon = '', desc = 'Show all' },
            { '<leader>nl', '<cmd>Noice last<cr>', icon = '󱞿', desc = 'Show last' },
            { '<leader>ne', '<cmd>Noice errors<cr>', icon = '', desc = 'Show errors' },
            { '<leader>nd', '<cmd>Noice dismiss<cr>', icon = '󰱞', desc = 'Dismiss visible' },
            {
                -- HACK: Yup, that's stupid
                '<leader>nf',
                function()
                    vim.cmd('Noice disable')
                    vim.cmd('Noice enable')
                end,
                icon = '',
                desc = 'Fix broken cmdline'
            },
        },
    },
}
