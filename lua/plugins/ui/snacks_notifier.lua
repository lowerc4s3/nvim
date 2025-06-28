return {
    -- Notifications UI
    'folke/snacks.nvim',
    opts = {
        notifier = {
            -- Custom "fancy" style based on default implemetation
            -- 1. Removed left icon padding
            -- 2. Changed winhl (couldn't set it from styles for some reason)
            ---@type snacks.notifier.render
            style = function(buf, notif, ctx)
                vim.api.nvim_buf_set_lines(buf, 0, 1, false, { '', '' })
                vim.api.nvim_buf_set_lines(buf, 2, -1, false, vim.split(notif.msg, '\n'))
                vim.api.nvim_buf_set_extmark(buf, ctx.ns, 0, 0, {
                    virt_text = {
                        { notif.icon, ctx.hl.icon },
                        { ' ' },
                        { notif.title or '', ctx.hl.title },
                    },
                    virt_text_win_col = 0,
                    priority = 10,
                })
                vim.api.nvim_buf_set_extmark(buf, ctx.ns, 0, 0, {
                    virt_text = {
                        { ' ' },
                        { os.date(ctx.notifier.opts.date_format, notif.added), ctx.hl.title },
                        { ' ' },
                    },
                    virt_text_pos = 'right_align',
                    priority = 10,
                })
                vim.api.nvim_buf_set_extmark(buf, ctx.ns, 1, 0, {
                    virt_text = { { string.rep('━', vim.o.columns - 2), ctx.hl.border } },
                    virt_text_win_col = 0,
                    priority = 10,
                })
                local winhl = ctx.opts.wo.winhighlight
                ctx.opts.wo.winhighlight = winhl:gsub(ctx.hl.msg, 'NormalFloat')
            end,
            icons = {
                error = '',
                warn = '',
                info = '',
                debug = '',
                trace = '󱒄',
            },
            margin = { top = 0, right = 0 },
        },
        styles = {
            notification = {
                border = 'none',
                wo = { winhighlight = 'Normal:SnacksNotifierMinimal' },
            },
        },
    },
}
