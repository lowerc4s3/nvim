return {
    {
        -- CMake integration
        'Civitasv/cmake-tools.nvim',
        ft = { "c", "cpp" },
        opts = {
            cmake_command = 'cmake',
            cmake_build_directory = 'build',
            cmake_build_directory_prefix = '',
            cmake_generate_options = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-D', 'CMAKE_CXX_COMPILER=clang++' },
            cmake_soft_link_compile_commands = true,
            cmake_build_options = {},
            cmake_console_size = 10,
            cmake_console_position = 'belowright',
            cmake_show_console = 'always',
            cmake_dap_configuration = { name = 'cpp', type = 'lldb', request = 'launch' },
            cmake_variants_message = {
                short = { show = true },
                long = { show = true, max_length = 40 }
            }
        },
        config = function(_, opts)
            require("cmake-tools").setup(opts)
            require("which-key").add {
                { "<leader>C", group = "CMake", icon = "" },
                { "<leader>Cb", "<cmd>CMakeBuild<CR>", icon = "", desc = "Build project" },
                { "<leader>Cr", "<cmd>CMakeRun<CR>", icon = "", desc = "Run project" },
                { "<leader>Cd", "<cmd>CMakeDebug<CR>", icon = "", desc = "Start debugging" },
                { "<leader>Cc", "<cmd>CMakeClean<CR>", icon = "󰃢", desc = "Clean" },
                { "<leader>Cs", group = "Select", icon = "" },
                { "<leader>Csb", "<cmd>CMakeSelectBuildType<CR>", icon = "", desc = "Build type" },
                { "<leader>Cst", "<cmd>CMakeSelectLaunchTarget<CR>", icon = "", desc = "Launch target" },
                { "<leader>Csp", "<cmd>CMakeSelectBuildPreset<CR>", icon = "", desc = "Build preset" },
            }
        end
    }
}
