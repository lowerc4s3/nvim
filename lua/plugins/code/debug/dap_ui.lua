return {
    -- VSCode-like DAP UI
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'mfussenegger/nvim-dap',
    },
    cmd = {
        'CMakeDebug',
        'DapContinue',
        'DapSetLogLevel',
        'DapShowLog',
        'DapStepInto',
        'DapStepOut',
        'DapStepOver',
        'DapTerminate',
        'DapToggleBreakpoint',
        'DapToggleRepl',
    },
    opts = {
        icons = { expanded = "󰅀", collapsed = "󰅂" },
        mappings = {
            expand = { "<CR>", "<2-LeftMouse>" },
            open   = "o",
            remove = "d",
            edit   = "e",
            repl   = "r",
        },
        layouts = {
            {
                elements = {
                    'scopes',
                    'breakpoints',
                    'stacks',
                    'watches',
                },
                size = 40,
                position = 'left',
            },
            {
                elements = {
                    'repl',
                    'console',
                },
                size = 10,
                position = 'bottom',
            },
        },
        floating = {
            max_height = nil,
            max_width = nil,
            border = "single",
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
        windows = { indent = 1 },
    }
}
