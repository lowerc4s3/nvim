return {
    -- Debug adapter protocol support
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    config = function()
        local dap = require('dap')

        dap.adapters.lldb = {
            type = 'executable',
            command = '/usr/local/opt/llvm/bin/lldb-vscode',
            name = 'lldb',
        }

        dap.adapters.delve = {
            type = 'server',
            port = '${port}',
            executable = {
                command = 'dlv',
                args = { 'dap', '-l', '127.0.0.1:${port}' },
            },
        }

        dap.configurations.cpp = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
            },
        }

        dap.configurations.go = {
            {
                type = 'delve',
                name = 'Debug',
                request = 'launch',
                program = '${file}',
            },
        }

        dap.configurations.c = dap.configurations.cpp

        vim.fn.sign_define('DapBreakpoint', {
            text = '',
            texthl = 'DiagnosticSignError',
            linehl = '',
            numhl = 'DiagnosticSignError',
        })
        vim.fn.sign_define(
            'DapStopped',
            { text = '', texthl = '', linehl = 'CursorLine', numhl = '' }
        )
        vim.fn.sign_define(
            'DapBreakpointCondition',
            { text = '', texthl = '', linehl = 'CursorLine', numhl = '' }
        )

        dap.defaults.fallback.focus_terminal = true

        local dapui = require('dapui')
        dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
        dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
        dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
            dap.repl.close()
        end
    end,
}
