return {
    -- Improved virtual text diagnostic messages
    "rachartier/tiny-inline-diagnostic.nvim",
    opts = {
        preset = "simple",
        signs = { diag = "•" },
        blend = { factor = 0.11 },
        options = {
            multilines = {
                enabled = true
            },
        }
    }
}
