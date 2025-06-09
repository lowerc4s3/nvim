return {
    -- Python DAP configurations
    'mfussenegger/nvim-dap-python',
    dependencies = 'mfussenegger/nvim-dap',
    ft = 'python',
    cmd = {
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
    config = function() require('dap-python').setup('~/.virtualenvs/debugpy/bin/python') end,
}
