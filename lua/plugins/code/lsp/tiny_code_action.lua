return {
    -- Code action menu
    'rachartier/tiny-code-action.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    keys = {
        {
            'gra',
            function() require('tiny-code-action').code_action() end,
            desc = 'Code action',
        },
    },
    opts = {
        backend = 'vim',
        picker = {
            'buffer',
            opts = {
                winborder = 'solid',
                hotkeys = true,
                auto_preview = true,
            },
        },
        signs = {
            quickfix = { '', { link = 'DiagnosticInfo' } },
            others = { '?', { link = 'DiagnosticWarning' } },
            refactor = { '', { link = 'DiagnosticWarning' } },
            ['refactor.move'] = { '', { link = 'DiagnosticInfo' } },
            ['refactor.extract'] = { '', { link = 'DiagnosticError' } },
            ['source.organizeImports'] = { '', { link = 'DiagnosticWarning' } },
            ['source.fixAll'] = { '', { link = 'DiagnosticError' } },
            ['source'] = { '', { link = 'DiagnosticError' } },
            ['rename'] = { '', { link = 'DiagnosticWarning' } },
            ['codeAction'] = { '', { link = 'DiagnosticError' } },
        },
    },
}
