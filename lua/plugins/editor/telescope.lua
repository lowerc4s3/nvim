return {
    -- Fuzzy finder
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim', -- Telescope picker for vim.ui.select
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, -- Native finder implemetation for telescope
    },
    opts = function()
        local actions = require('telescope.actions')

        return {
            defaults = {
                prompt_prefix = '  ',
                selection_caret = ' ',
                entry_prefix = ' ',
                scroll_strategy = 'limit',
                sorting_strategy = 'ascending',
                results_title = false,
                dynamic_preview_title = true,
                history = false,
                borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
                layout_config = {
                    prompt_position = 'top',
                    horizontal = {
                        preview_width = 0.5,
                    },
                },
                mappings = {
                    i = {
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<tab>'] = actions.select_default,
                        ['<esc>'] = actions.close,
                    },
                },
            },

            extensions = {
                ['ui-select'] = {
                    layout_strategy = 'vertical',
                },
            },
        }
    end,
    config = function(_, opts)
        local telescope = require('telescope')
        telescope.setup(opts)

        telescope.load_extension('fzf')
        telescope.load_extension('ui-select')
    end,
}
