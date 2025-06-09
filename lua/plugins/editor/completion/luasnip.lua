return {
    -- Advanced snippet engine
    'L3MON4D3/LuaSnip',
    lazy = true,
    version = 'v2.*',
    config = function()
        require('luasnip.loaders.from_vscode').lazy_load {
            paths = { vim.fn.stdpath('config') .. '/snippets/vscode' },
        }
        require('luasnip.loaders.from_lua').lazy_load {
            paths = { vim.fn.stdpath('config') .. '/snippets/luasnip' },
        }
        vim.keymap.set({ 'i', 's' }, '<C-I>', function()
            if require('luasnip').choice_active() then require('luasnip').change_choice(1) end
        end, { silent = true })
    end,
}
