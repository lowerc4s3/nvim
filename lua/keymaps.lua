local map = vim.keymap.set

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = "Disable space mapping" })

map("n", "<cr>", "ciw", { silent = true, desc = "Replace the word under cursor" })

map("v", "y", "ygv<esc>", { silent = true, desc = "Make cursor stay when yanking in visual mode" })

map("n", "<C-h>", "<C-w>h", { silent = true, desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { silent = true, desc = "Move to right window" })

map("i", "<C-h>", "<Left>", { silent = true, desc = "Move right" })
map("i", "<C-j>", "<Down>", { silent = true, desc = "Move down" })
map("i", "<C-k>", "<Up>", { silent = true, desc = "Move up" })
map("i", "<C-l>", "<Right>", { silent = true, desc = "Move left" })

map("n", "L", "<cmd>bnext<cr>", { silent = true, desc = "Go to next buffer" })
map("n", "H", "<cmd>bprev<cr>", { silent = true, desc = "Go to previous buffer" })
map("n", "<Tab>", "<cmd>Telescope buffers<cr>", { silent = true, desc = "List open buffers" })

map("n", "<ESC>", ":noh<CR>", { silent = true, desc = "Disable search highlight" })

map({ "n", "i", "t" }, "<C-\\>", "<cmd>ToggleTerm<CR>", { silent = true, desc = "Open ToggleTerm" })

map("n", "@", '<cmd>execute "noautocmd norm!" . v:count1 . "@" . getcharstr()<CR>',
    { silent = true, desc = "Instant macros" })

map('n', ']d', function() vim.diagnostic.jump { count = 1 } end, { silent = true, desc = "Jump to next diagnostic" })
map('n', '[d', function() vim.diagnostic.jump { count = -1 } end, { silent = true, desc = "Jump to previous diagnostic" })
