return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "php",
        "phpdoc",
      })
    end,
  },
  -- add phpactor and intelephense to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        phpactor = {},
        intelephense = {},
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "<leader>cl", false }
      keys[#keys + 1] = { "gD", false }
      keys[#keys + 1] = { "gI", false }
      keys[#keys + 1] = { "gy", false }
      keys[#keys + 1] = { "gK", false }
      keys[#keys + 1] = { "<leader>cA", false }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "phpactor", "intelephense", "php-cs-fixer" })
    end,
  },
}
