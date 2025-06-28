-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { import = 'plugins.editor' },
    { import = 'plugins.editor.treesitter' },
    { import = 'plugins.editor.completion' },

    { import = 'plugins.ui' },
    { import = 'plugins.ui.colorschemes' },

    { import = 'plugins.fs' },

    { import = 'plugins.code' },
    { import = 'plugins.code.git' },
    { import = 'plugins.code.lang.c' },
    { import = 'plugins.code.lang.markdown' },
    { import = 'plugins.code.lang.typst' },
    { import = 'plugins.code.lsp' },
    { import = 'plugins.code.debug' },

    { import = 'plugins.utils' },
}, {
    install = { colorscheme = { 'catppuccin' } },
    change_detection = { notify = false },
    checker = {
        enabled = true,
        frequency = 604800, -- Check for updates every week
    },
})
