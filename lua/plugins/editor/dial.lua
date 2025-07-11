return {
    -- Enhanced increment and decrement
    'monaqa/dial.nvim',
    keys = {
        {
            '<C-a>',
            function() require('dial.map').manipulate('increment', 'normal') end,
        },
        {
            '<C-x>',
            function() require('dial.map').manipulate('decrement', 'normal') end,
        },
        {
            'g<C-a>',
            function() require('dial.map').manipulate('increment', 'gnormal') end,
        },
        {
            'g<C-x>',
            function() require('dial.map').manipulate('decrement', 'gnormal') end,
        },
        {
            '<C-a>',
            function() require('dial.map').manipulate('increment', 'visual') end,
            mode = 'v',
        },
        {
            '<C-x>',
            function() require('dial.map').manipulate('decrement', 'visual') end,
            mode = 'v',
        },
        {
            'g<C-a>',
            function() require('dial.map').manipulate('increment', 'gvisual') end,
            mode = 'v',
        },
        {
            'g<C-x>',
            function() require('dial.map').manipulate('decrement', 'gvisual') end,
            mode = 'v',
        },
    },
    config = function()
        local augend = require('dial.augend')
        require('dial.config').augends:register_group {
            default = {
                augend.integer.alias.decimal_int,
                augend.integer.alias.hex,
                augend.integer.alias.binary,
                augend.constant.alias.bool,
                augend.constant.new {
                    elements = { 'and', 'or' },
                    word = true,
                    cyclic = true,
                },
                augend.constant.new {
                    elements = { '&&', '||' },
                    word = false,
                    cyclic = true,
                },
            },
            markdown = {
                augend.integer.alias.decimal_int,
                augend.integer.alias.hex,
                augend.integer.alias.binary,
                augend.constant.new {
                    elements = { '[ ]', '[x]' },
                    word = true,
                    cyclic = true,
                },
            },
        }
    end,
}
