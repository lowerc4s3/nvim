return {
    -- Highlight color codes
    'catgoose/nvim-colorizer.lua',
    event = 'VeryLazy',
    opts = {
        user_default_options = {
            names = false,
            mode = 'virtualtext',
            virtualtext = '',
            virtualtext_inline = true,
        },
        css = { css = true },
    },
}
