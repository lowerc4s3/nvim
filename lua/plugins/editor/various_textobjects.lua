return {
    -- Additional textobjects
    'chrisgrieser/nvim-various-textobjs',
    event = 'VeryLazy',
    opts = {},
    keys = {
        { 'is', '<cmd>lua require("various-textobjs").subword("inner")<cr>', mode = { 'x', 'o' } },
        { 'as', '<cmd>lua require("various-textobjs").subword("outer")<cr>', mode = { 'x', 'o' } },
        { 'iS', 'is', mode = { 'x', 'o' } },
        { 'aS', 'as', mode = { 'x', 'o' } },
        { 'as', '<cmd>lua require("various-textobjs").subword("outer")<cr>', mode = { 'x', 'o' } },
        { 'ik', '<cmd>lua require("various-textobjs").key("inner")<cr>', mode = { 'x', 'o' } },
        { 'ak', '<cmd>lua require("various-textobjs").key("outer")<cr>', mode = { 'x', 'o' } },
        { 'iv', '<cmd>lua require("various-textobjs").value("inner")<cr>', mode = { 'x', 'o' } },
        { 'av', '<cmd>lua require("various-textobjs").value("outer")<cr>', mode = { 'x', 'o' } },
        { 'gG', '<cmd>lua require("various-textobjs").entireBuffer()<cr>', mode = { 'x', 'o' } },
    },
}
