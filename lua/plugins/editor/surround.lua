return {
    -- Surround actions
    'kylechui/nvim-surround',
    version = '^3.0.0',
    event = 'VeryLazy',
    opts = {
        move_cursor = 'sticky',
        keymaps = {
            insert = '<C-g>z',
            insert_line = '<C-g>j',
            normal = 'gz',
            normal_cur = 'gzz',
            normal_line = 'gZ',
            normal_cur_line = 'gZZ',
            visual = 'gz',
            visual_line = 'gZ',
            delete = 'gzd',
            change = 'gzr',
        },
    },
}
