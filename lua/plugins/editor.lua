local ui_utils = require("stormvim.util.ui")

return {
  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = {
      { "<C-e>", ":Neotree toggle<CR>", desc = "Explorer NeoTree" },
    },
    opts = {
      sources = { "filesystem" },
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        mappings = {
          ["<space>"] = "none",
          ["Y"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  },

  -- Fuzzy finder.
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local action_state = require('telescope.actions.state')
      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          path_display = { "truncate " },
          preview = {
            filesize_limit = 1, -- Mb
          },
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              mirror = false,
              prompt_position = "top",
            },
          },
          sorting_strategy = 'ascending',
          results_title = false,
          dynamic_preview_title = true,
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-h>"] = "which_key"
            },
          },
        },
        pickers = {
          find_files = {
            path_display = ui_utils.filename_first, -- see https://github.com/nvim-telescope/telescope.nvim/issues/2014#issuecomment-1873229658
          },
          buffers = {
            mappings = {
              i = {
                ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
              }
            },
          },
          git_commits = {
            mappings = {
              i = {
                ["<C-o>"] = function() -- show diffview for the selected commit
                  -- Open in diffview
                  local entry = action_state.get_selected_entry()
                  -- close Telescope window properly prior to switching windows
                  actions.close(vim.api.nvim_get_current_buf())
                  vim.cmd(("DiffviewOpen %s^!"):format(entry.value))
                end,
              },
            },
          },
          git_bcommits = {
            mappings = {
              i = {
                ["<C-o>"] = function() -- show diffview for the selected commit of current buffer
                  -- Open in diffview
                  local entry = action_state.get_selected_entry()
                  -- close Telescope window properly prior to switching windows
                  actions.close(vim.api.nvim_get_current_buf())
                  vim.cmd(("DiffviewOpen %s^!"):format(entry.value))
                end,
              },
            },
          },
          git_branches = {
            mappings = {
              i = {
                ["<C-o>"] = function() -- show diffview comparing the selected branch with the current branch
                  -- Open in diffview
                  local entry = action_state.get_selected_entry()
                  -- close Telescope window properly prior to switching windows
                  actions.close(vim.api.nvim_get_current_buf())
                  vim.cmd(("DiffviewOpen %s.."):format(entry.value))
                end,
              },
            },
          },
        },
      })

      telescope.load_extension("fzf")

      -- set keymaps
      local keymap = vim.keymap -- for conciseness
      local builtin = require('telescope.builtin')
      keymap.set("n", "<C-f>f", builtin.find_files, { desc = "Find files" })
      keymap.set("n", "<C-f>s", builtin.live_grep, { desc = "Find string" })
      keymap.set("n", "<C-f>b", builtin.buffers, { desc = "Find buffers" })
      keymap.set("n", "<C-f>c", builtin.git_commits, { desc = "Find commits" })
      keymap.set("n", "<C-f>k", builtin.keymaps, { desc = "Find keymaps" })
      keymap.set("n", "<C-f>g", builtin.git_branches, { desc = "Git branches" })
      keymap.set("n", "<leader>t", builtin.treesitter, { desc = "Document symbols" })
      keymap.set("n", "<C-f>,", ":Config<CR>", { desc = "Find in config" })
    end,
  },

  -- git signs highlights text that has changed since the list
  -- git commit, and also lets you interactively stage & unstage
  -- hunks in a commit.
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },

  -- git diff tool
  {
    "sindrets/diffview.nvim",
    lazy = false,
    config = function()
      local actions = require("diffview.actions")
      require('diffview').setup({
        diff_binaries = false,
        enhanced_diff_hl = true,
        keymaps = {
          file_panel = {
            { "n", "a", actions.toggle_stage_entry, { desc = "Stage / unstage the selected entry" } },
            { "n", "A", actions.stage_all,          { desc = "Stage all entries" } },
            { "n", "r", actions.restore_entry       { desc = "Restore entry to the state on the left side" } },
          },
        },
      })
    end,
  },
  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      signs = {
      -- icons / text used for a diagnostic
      error = "'",
      warning = "",
      hint = "",
      information = "󰋼'",
      other = "",
    },
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      { "<leader>d", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>q", "<cmd>TroubleToggle quickfix<cr>", desc = "Diagnostic Quickfix List" },
    },
  },

  -- colorizer text like #RGB
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
}
