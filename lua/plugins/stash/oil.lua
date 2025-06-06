return {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = "echasnovski/mini.icons",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    config = function(_, opts)
        require("oil").setup(opts)
        vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
    end
}
