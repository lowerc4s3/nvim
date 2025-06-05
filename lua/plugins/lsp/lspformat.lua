return {
    -- Format on save
    "lukas-reineke/lsp-format.nvim",
    lazy = true,
    opts = {
        lua = { exclude = { "lua_ls" } }
    }
}
