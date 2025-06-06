return {
    -- Surround actions
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    opts = {
        move_cursor = "sticky",
        keymaps = {
            insert = "<C-g>s",
            insert_line = "<C-g>S",
            normal = "gs",
            normal_cur = "gss",
            normal_line = "gS",
            normal_cur_line = "gSS",
            visual = "gs",
            visual_line = "gS",
            delete = "gsd",
            change = "gsr",
            change_line = "gsR",
        }
    }
}
