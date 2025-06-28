return {
    -- Animations for yank/undo/etc
    'rachartier/tiny-glimmer.nvim',
    event = 'VeryLazy',
    priority = 10,
    opts = {
        overwrite = {
            undo = { enabled = true },
            redo = { enabled = true },
            paste = { default_animation = 'fade' },
        },
    },
}
