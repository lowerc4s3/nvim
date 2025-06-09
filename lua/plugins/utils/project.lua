return {
    -- Project manager (forked version of ahmedkhalf/project.nvim)
    'Zeioth/project.nvim',
    main = 'project_nvim',
    lazy = false,
    opts = {
        patterns = { '.git', 'Makefile', 'makefile', 'CMakeLists.txt', '.projectile' },
        detection_methods = { 'lsp', 'pattern' },
    },
}
