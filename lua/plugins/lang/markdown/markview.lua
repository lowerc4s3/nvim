return {
    -- Render markdown/LaTeX/etc in buffer
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 999,
    opts = {
        preview = {
            filetypes = { "markdown", "md", "rmd", "quarto", "tex", "typst" },
            modes = { "n", "no", "c", "i" },
            hybrid_modes = { "i", "n" },
            linewise_hybrid_mode = false
        },
        markdown = {
            enable = true,
            list_items = {
                wrap = true,
                marker_minus = {
                    text = "•"
                }
            },
            tables = {
                parts = {
                    top = { "┌", "─", "┐", "┬" },
                    header = { "│", "│", "│" },
                    separator = { "├", "─", "┤", "┼" },
                    row = { "│", "│", "│" },
                    bottom = { "└", "─", "┘", "┴" },

                    overlap = { "┝", "━", "┥", "┿" },

                    align_left = "╼",
                    align_right = "╾",
                    align_center = { "╴", "╶" }
                }
            }
        },
        latex = {
            -- TODO: Finish latex config
            enable = false,
            fonts = {
                enable = false,
            },
            symbols = {
                enable = false,
            }
        }
    }
}
