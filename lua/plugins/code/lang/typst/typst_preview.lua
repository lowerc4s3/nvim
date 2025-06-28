return {
    -- Preview rendered Typst in browser
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    opts = {
        -- Explicitly set dependencies to stop plugin from downloading them
        -- (use mason or system package manager for that)
        dependencies_bin = {
            ['tinymist'] = 'tinymist',
            ['websocat'] = 'websocat',
        },
    },
}
