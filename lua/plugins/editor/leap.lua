return {
    -- Search labels navigation
    'ggandor/leap.nvim',
    dependencies = 'tpope/vim-repeat',
    config = function()
        require('leap').set_default_mappings()

        vim.keymap.set({ 'n', 'x', 'o' }, 'gs', function() require('leap.remote').action() end)
        vim.keymap.set({ 'x', 'o' }, 'R', function() require('leap.treesitter').select() end)

        -- Remote text objects
        local remote_text_object = function(prefix)
            local ok, ch = pcall(vim.fn.getcharstr) -- pcall for handling <C-c>
            if not ok or (ch == vim.keycode('<esc>')) then return end
            require('leap.remote').action { input = prefix .. ch }
        end
        vim.keymap.set({ 'x', 'o' }, 'ar', function() remote_text_object('a') end)
        vim.keymap.set({ 'x', 'o' }, 'ir', function() remote_text_object('i') end)
    end,
}
