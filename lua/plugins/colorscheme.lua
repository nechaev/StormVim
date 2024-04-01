return {
  -- darkstorm
  {
    "nechaev/darkstorm.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    lazy = false,
    opts = {},

    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme darkstorm]])
    end,
  },
  { "catppuccin/nvim", enabled = false },
}
