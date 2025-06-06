return {
    -- Task runner
    "stevearc/overseer.nvim",
    dependencies = 'nvim-telescope/telescope.nvim',
    cmd = { "OverseerRun", "OverseerToggle", "OverseerOpen", "OverseerClose" },
    opts = {}
}
