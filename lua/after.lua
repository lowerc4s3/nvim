--- File for performing actions after loading all plugins (usually highlights) ---

---@param name string
---@param val vim.api.keyset.highlight
local function set_hl(name, val) vim.api.nvim_set_hl(0, name, val) end

---@param name string
---@param val string | integer
local function link_hl(name, val) vim.api.nvim_set_hl(0, name, { link = val }) end

---@param name string
---@param type "fg" | "bg"
---@return string
local function get_hl_part(name, type)
    return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(name)), type, 'gui')
end

---@param name string
local function get_fg(name) return get_hl_part(name, 'fg') end

---@param name string
local function get_bg(name) return get_hl_part(name, 'bg') end

-- Set highlights

-- Telescope
link_hl('TelescopePromptBorder', 'CursorLine')
link_hl('TelescopePromptNormal', 'CursorLine')
link_hl('TelescopeNormal', 'lualine_c_normal')
link_hl('TelescopeNormal', 'lualine_c_normal')
link_hl('TelescopePreviewBorder', 'lualine_c_normal')
link_hl('TelescopeResultsBorder', 'lualine_c_normal')
link_hl('TelescopePreview', 'lualine_c_normal')
link_hl('TelescopeResults', 'lualine_c_normal')
link_hl('TelescopeTitle', 'lualine_a_insert')

-- Floating window borders
link_hl('FloatBorder', 'NormalFloat')

-- mini.files
set_hl('MiniFilesBorderModified', { fg = get_fg('WarningMsg'), bg = get_bg('NormalFloat') })
link_hl('MiniFilesTitle', 'FloatBorder')
link_hl('MiniFilesTitleFocused', 'FloatBorder')

-- Disable nvimtree separator
link_hl('NvimTreeVertSplit', 'Ignore')

-- Cattpuccin termcolors (catppuccin theme integration is ass)
if vim.g.neovide and vim.g.colors_name:find('catppuccin', 1, true) == 1 then
    vim.g.terminal_color_0 = '#45475A'
    vim.g.terminal_color_8 = '#45475A'
    vim.g.terminal_color_1 = '#F38BA8'
    vim.g.terminal_color_9 = '#F38BA8'
    vim.g.terminal_color_2 = '#A6E3A1'
    vim.g.terminal_color_10 = '#A6E3A1'
    vim.g.terminal_color_3 = '#F9E2AF'
    vim.g.terminal_color_11 = '#F9E2AF'
    vim.g.terminal_color_4 = '#89B4FA'
    vim.g.terminal_color_12 = '#89B4FA'
    vim.g.terminal_color_5 = '#F5C2E7'
    vim.g.terminal_color_13 = '#F5C2E7'
    vim.g.terminal_color_6 = '#94E2D5'
    vim.g.terminal_color_14 = '#94E2D5'
    vim.g.terminal_color_7 = '#BAC2DE'
    vim.g.terminal_color_15 = '#BAC2DE'
end
