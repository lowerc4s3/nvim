return {
    -- Search labels navigation
    "ggandor/leap.nvim",
    dependencies = "tpope/vim-repeat",
    config = function()
        vim.keymap.set({ "n", "x", "o" }, "m", "<Plug>(leap)")
        vim.keymap.set("n", "M", "<Plug>(leap-from-window)")
    end
}
