return {
    -- Indentation lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = {
        indent = {
            char = '│',
        },
        scope = {
            show_start = false,
            show_end = false,
        },
    },
}
