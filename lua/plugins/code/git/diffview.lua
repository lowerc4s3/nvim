return {
    -- Cycle through modified files
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    cmd = {
        'DiffviewOpen',
        'DiffviewClose',
        'DiffviewToggleFiles',
        'DiffviewFocusFiles',
        'DiffviewRefresh',
    },
    opts = {
        icons = {
            folder_closed = '',
            folder_open = '',
        },
        signs = {
            fold_closed = '',
            fold_open = '',
        },
        file_panel = {
            win_config = { width = 30 },
        },
        keymaps = {
            file_panel = { { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close diffview' } } },
        },
    },
}
