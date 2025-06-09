-- Line height
vim.opt.linespace = 13

-- Window padding
vim.g.neovide_padding_top = 6
vim.g.neovide_padding_bottom = 6
vim.g.neovide_padding_right = 6
vim.g.neovide_padding_left = 6

-- Scroll animation
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_scroll_animation_far_lines = 3

-- Cursor animation
vim.g.neovide_cursor_animation_length = 0.150
vim.g.neovide_cursor_short_animation_length = 0.04
vim.g.neovide_cursor_trail_size = 1.0

-- Disable floating shadow
vim.g.neovide_floating_shadow = false

-- New instance keymap
if vim.g.neovide and vim.fn.has('macunix') then
    vim.keymap.set('n', '<D-n>', function()
        vim.uv.spawn('neovide', { detached = true }, function() end)
    end, { silent = true })
end

-- Paste in insert mode keymap
vim.keymap.set(
    { 'n', 'v', 's', 'x', 'o', 'i', 'l', 'c', 't' },
    '<D-v>',
    function() vim.api.nvim_paste(vim.fn.getreg('+'), true, -1) end,
    { noremap = true, silent = true }
)
