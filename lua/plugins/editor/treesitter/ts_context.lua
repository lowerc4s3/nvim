return {
    -- Show code context
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = {
        mode = "topline",
        max_lines = 2,
    }
}
