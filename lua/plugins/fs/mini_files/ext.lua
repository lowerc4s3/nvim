local M = {}

---@class mini.files.ext.Config
---@field mappings mini.files.ext.Config.Mappings?
---@field sync_on_write boolean?

---@class mini.files.ext.Config.Mappings
---@field open string?
---@field copy_path string?
---@field cd string?

---@type mini.files.ext.Config
local default_opts = {
    mappings = nil,
    sync_on_write = false,
}

---@return table
local function map_opts(buf_id, desc)
    return {
        buffer = buf_id,
        silent = true,
        desc = desc,
    }
end

local function copy_path()
    local entry = MiniFiles.get_fs_entry()
    if not entry then
        vim.notify(
            'No file or directory selected',
            vim.log.levels.WARN,
            { title = 'mini.files.ext' }
        )
        return
    end

    vim.fn.setreg('+', entry.path)
    vim.notify(
        string.format('Copied %s to system clipboard', entry.path),
        vim.log.levels.INFO,
        { title = 'mini.files.ext' }
    )
end

local function open()
    local entry = MiniFiles.get_fs_entry()
    if not entry then
        vim.notify(
            'No file or directory selected',
            vim.log.levels.WARN,
            { title = 'mini.files.ext' }
        )
        return
    end

    local _, err = vim.ui.open(entry.path)
    if err then
        vim.notify(
            string.format('Cannot open %s: %s', entry.path, err),
            vim.log.levels.ERROR,
            { title = 'mini.files.ext' }
        )
    end
end

local function cd()
    local entry = MiniFiles.get_fs_entry()
    if not entry then
        vim.notify(
            'No file or directory selected',
            vim.log.levels.WARN,
            { title = 'mini.files.ext' }
        )
        return
    end

    if vim.uv.fs_stat(entry.path).type ~= 'directory' then
        vim.notify(
            string.format('Cannot CWD to %s: not a directory', entry.path),
            vim.log.levels.WARN,
            { title = 'mini.files.ext' }
        )
        return
    end

    vim.fn.chdir(entry.path)
    MiniFiles.go_in()
    vim.notify('Changed CWD to ' .. entry.path, vim.log.levels.INFO, { title = 'mini.files.ext' })
end

-- FIXME: Sometimes cannot set buffer name
local function sync_on_write(buf_id)
    vim.schedule(function()
        vim.bo.buftype = 'acwrite'
        vim.api.nvim_buf_set_name(buf_id, require('mini.files').get_fs_entry(0, 1).path)
        vim.api.nvim_create_autocmd('BufWriteCmd', {
            buffer = buf_id,
            callback = function() require('mini.files').synchronize() end,
        })
    end)
    -- vim.schedule(function()
    --     vim.bo.buftype = 'acwrite'
    --     vim.api.nvim_buf_set_name(0, tostring(vim.api.nvim_get_current_win()))
    --     vim.api.nvim_create_autocmd('BufWriteCmd', {
    --         buffer = buf,
    --         callback = function() require('mini.files').synchronize() end,
    --     })
    -- end)
end

local function hide_borders(win)
    local config = vim.api.nvim_win_get_config(win)
    config.border = 'solid'
    vim.api.nvim_win_set_config(win, config)
end

---@param opts mini.files.ext.Config
function M.setup(opts)
    opts = vim.tbl_deep_extend('force', default_opts, opts)
    vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(event)
            local buf_id = event.data.buf_id
            if opts.mappings.open then
                vim.keymap.set('n', opts.mappings.open, open, map_opts(buf_id, 'System open'))
            end
            if opts.mappings.copy_path then
                vim.keymap.set(
                    'n',
                    opts.mappings.copy_path,
                    copy_path,
                    map_opts(buf_id, 'Copy absolute path')
                )
            end
            if opts.sync_on_write then sync_on_write(event.data.buf_id) end
            if opts.mappings.cd then
                vim.keymap.set('n', opts.mappings.cd, cd, map_opts(buf_id, 'Change CWD'))
            end
        end,
    })
    vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesWindowOpen',
        callback = function(event) hide_borders(event.data.win_id) end,
    })
end

return M
