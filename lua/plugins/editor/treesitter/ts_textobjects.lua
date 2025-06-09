return {
    -- Custom text objects
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = 'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    opts = {
        select = {
            lookahead = true,
            selection_modes = {
                ["@function.outer"] = "V",
                ["@loop.outer"] = "V",
                ["@condition.outer"] = "V",
                ["@class.outer"] = "V",
                ["@comment.outer"] = "V",
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter-textobjects").setup(opts)
        local select_mappings = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ai"] = "@condition.outer",
            ["ii"] = "@condition.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aC"] = "@comment.outer",
            ["iC"] = "@comment.inner",
            ["aP"] = "@parameter.outer",
            ["iP"] = "@parameter.inner",
        }

        local select = require("nvim-treesitter-textobjects.select").select_textobject
        for lhs, capture in pairs(select_mappings) do
            vim.keymap.set({ "x", "o" }, lhs, function() select(capture, "textobjects") end)
        end
    end,
    keys = {
        { "af", mode = { "x", "o" } },
        { "if", mode = { "x", "o" } },
        { "al", mode = { "x", "o" } },
        { "il", mode = { "x", "o" } },
        { "ai", mode = { "x", "o" } },
        { "ii", mode = { "x", "o" } },
        { "ac", mode = { "x", "o" } },
        { "ic", mode = { "x", "o" } },
        { "aC", mode = { "x", "o" } },
        { "iC", mode = { "x", "o" } },
        { "aP", mode = { "x", "o" } },
        { "iP", mode = { "x", "o" } },
    }
}
