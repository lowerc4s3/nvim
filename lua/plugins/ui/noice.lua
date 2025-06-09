return {
    -- General UI replacements
    "folke/noice.nvim",
    dependencies = "Muniftanjim/nui.nvim",
    opts = {
        cmdline = {
            view = "cmdline",
            format = {
                cmdline = { pattern = "^:", icon = " ", lang = "vim" },
                search_down = { kind = "search", pattern = "^/", icon = " /", lang = "regex" },
                search_up = { kind = "search", pattern = "^%?", icon = " ?", lang = "regex" },
                filter = { pattern = "^:%s*!", icon = " $", lang = "bash" },
                lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " 󰢱", lang = "lua" },
                input = { view = "cmdline", icon = " " },
                help = false,
            }
        },
        popupmenu = { enabled = false },
        commands = {
            errors = { view = "split" },
            last = { view = "split" },
        },
        lsp = {
            progress = {
                format_done = {
                    { " ", hl_group = "NoiceLspProgressSpinner" },
                    { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
                    { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
                }
            },
            signature = { enabled = false },
            hover = { enabled = false },
        },
        views = {
            popup = { border = { style = "none" } },
            cmdline = {
                win_options = {
                    winhighlight = {
                        Normal = "NormalFloat"
                    }
                }
            }
        },
        routes = {
            {
                -- Pass delete and yank messages to mini view
                filter = {
                    event = "msg_show",
                    any = {
                        { find = "%d fewer lines" },
                        { find = "%d more lines" },
                        { find = "%d lines <ed %d time[s]?" },
                        { find = "%d lines >ed %d time[s]?" },
                        { find = "%d lines yanked" },
                    }
                },
                view = "mini",
            },
            {
                -- Disable lsp_signature.nvim error messages
                -- which appear when rust-analyzer is loading
                filter = {
                    event = "msg_show",
                    find = "lsp_signatur handler RPC"
                },
                opts = { skip = true }
            }
        }
    }
}
