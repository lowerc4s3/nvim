return {
    -- Search labels navigation
    "ggandor/leap.nvim",
    dependencies = "tpope/vim-repeat",
    config = function()
        local leap = require("leap")
        leap.set_default_mappings()
    end
}
