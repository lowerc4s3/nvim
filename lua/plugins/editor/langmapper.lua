return {
    -- Register keymaps with cyrillic support
    'Wansmer/langmapper.nvim',
    lazy = false,
    priority = 1001,
    opts = {
        -- Set trivial description to filter from which-key
        custom_desc = function()
            return "wkignore"
        end
    }
}
