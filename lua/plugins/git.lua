return {
  -- git diff tool
  {
    "sindrets/diffview.nvim",
    lazy = false,
    config = function()
      local actions = require("diffview.actions")
      require("diffview").setup({
        diff_binaries = false,
        enhanced_diff_hl = true,
        keymaps = {
          file_panel = {
            { "n", "a", actions.toggle_stage_entry, { desc = "Stage / unstage the selected entry" } },
            { "n", "A", actions.stage_all, { desc = "Stage all entries" } },
            { "n", "r", actions.restore_entry({ desc = "Restore entry to the state on the left side" }) },
          },
        },
      })
    end,
  },
}
