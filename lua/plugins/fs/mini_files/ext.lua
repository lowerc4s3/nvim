local M = {}

---@class mini.files.ext.Config
---@field mappings mini.files.ext.Config.Mappings?
---@field sync_on_write boolean?

---@class mini.files.ext.Config.Mappings
---@field open string?
---@field copy_path string?

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
        desc = desc
    }
end

local function copy_path()
    local entry = MiniFiles.get_fs_entry()
    if not entry then
        vim.notify("No file or directory selected", vim.log.levels.WARN)
        return
    end

    vim.fn.setreg("+", entry.path)
end

local function open()
    local entry = MiniFiles.get_fs_entry()
    if not entry then
        vim.notify("No file or directory selected", vim.log.levels.WARN)
        return
    end

    local _, err = vim.ui.open(entry.path)
    if err then
        vim.notify(string.format("Cannot open %s: %s", entry.path, err), vim.log.levels.ERROR)
    end
end

-- FIXME: Sometimes cannot set buffer name
local function sync_on_write(event)
    vim.schedule(function()
        vim.bo.buftype = "acwrite"
        vim.api.nvim_buf_set_name(0, tostring(vim.api.nvim_get_current_win()))
        vim.api.nvim_create_autocmd('BufWriteCmd', {
            buffer = event.data.buf_id,
            callback = function()
                require('mini.files').synchronize()
            end,
        })
    end)
end

---@param opts mini.files.ext.Config
function M.setup(opts)
    opts = vim.tbl_deep_extend("force", default_opts, opts)
    vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(event)
            local buf_id = event.data.buf_id
            if opts.mappings.open then
                vim.keymap.set("n", opts.mappings.open, open, map_opts(buf_id, "System open"))
            end
            if opts.mappings.copy_path then
                vim.keymap.set("n", opts.mappings.copy_path, copy_path, map_opts(buf_id, "Copy absolute path"))
            end
            if opts.sync_on_write then sync_on_write(event) end
        end
    })
end

return M
