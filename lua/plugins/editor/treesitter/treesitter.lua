return {
    -- Syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    dependencies = 'OXY2DEV/markview.nvim',
    config = function()
        local parsers = require("nvim-treesitter").get_installed()
        if #parsers ~= 0 then
            vim.api.nvim_create_autocmd('FileType', {
                pattern = parsers,
                callback = function()
                    vim.treesitter.start()
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            })
        end
    end
}
