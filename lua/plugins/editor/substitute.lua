return {
    -- Exchange text
    'gbprod/substitute.nvim',
    opts = {},
    keys = {
        {
            'cx',
            function() require('substitute.exchange').operator() end,
        },
        {
            'cxx',
            function() require('substitute.exchange').line() end,
        },
        {
            'X',
            function() require('substitute.exchange').visual() end,
            mode = 'v',
        },
    },
}
