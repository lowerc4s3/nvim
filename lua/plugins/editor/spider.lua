return {
    -- Make w, e, b motions move by subwords
    "chrisgrieser/nvim-spider",
    dependencies = { "rami3l/nvim-spider-utf8", build = "rockspec" },
    keys = {
        {
            "e",
            "<cmd>lua require('spider').motion('e')<CR>",
            mode = { "n", "o", "x" },
        },
        {
            "w",
            "<cmd>lua require('spider').motion('w')<CR>",
            mode = { "n", "o", "x" },
        },
        {
            "b",
            "<cmd>lua require('spider').motion('b')<CR>",
            mode = { "n", "o", "x" },
        },
        {
            "ge",
            "<cmd>lua require('spider').motion('ge')<CR>",
            mode = { "n", "o", "x" },
        },
    },
}
