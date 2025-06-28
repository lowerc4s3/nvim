return {
    -- Highlight color codes
    'catgoose/nvim-colorizer.lua',
    event = 'VeryLazy',
    opts = {
        user_default_options = {
            names = false,
            mode = 'virtualtext',
            virtualtext = '',
            virtualtext_inline = 'before',
            RGB = false,
            RGBA = false,
        },
        css = { css = true },
    },
}
