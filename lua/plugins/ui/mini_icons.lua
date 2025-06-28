return {
    -- Icons provider
    'echasnovski/mini.icons',
    lazy = true,
    -- Lazily mock devicons (snippet by folke)
    specs = { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
    init = function()
        package.preload['nvim-web-devicons'] = function()
            require('mini.icons').mock_nvim_web_devicons()
            return package.loaded['nvim-web-devicons']
        end
    end,
    opts = {
        file = {
            LICENSE = { glyph = '' },
            ['LICENSE.md'] = { glyph = '' },
            ['LICENSE.txt'] = { glyph = '' },
            README = { glyph = '󰭤' },
            ['README.md'] = { glyph = '󰭤' },
            ['README.txt'] = { glyph = '󰭤' },
        },
        filetype = {
            hjson = { glyph = '' },
            json = { glyph = '' },
            json5 = { glyph = '' },
            jsonc = { glyph = '' },
            jsonl = { glyph = '' },
            telescopeprompt = { glyph = '' },
            overseerform = { glyph = '' },
            overseerlist = { glyph = '' },
            typst = { glyph = '' },
        },
    },
}
