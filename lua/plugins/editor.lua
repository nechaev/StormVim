local Util = require("stormvim.util")
local Icons = require("lazyvim.config").icons

return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    -- rewrite keys
    keys = function()
      return {
        -- stylua: ignore

        -- find
        { "<leader>/", Util.telescope("live_grep"), desc = "Grep (root dir)" },
        { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
        { "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
        { "<leader>,", "<cmd>Config<cr>", desc = "Find Config File" },
        { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
        { "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
        { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },

        -- git
        { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Git commits" },
        { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
        -- search
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
        { "<leader>?", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
        -- treesitter
        { "<leader>cs", "<cmd>Telescope treesitter<cr>", desc = "Document symbols" },
      }
    end,
    -- change some options
    opts = function()
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      local open_with_trouble = function(...)
        return require("trouble.providers.telescope").open_with_trouble(...)
      end
      local open_selected_with_trouble = function(...)
        return require("trouble.providers.telescope").open_selected_with_trouble(...)
      end
      local find_files_no_ignore = function()
        local line = action_state.get_current_line()
        Util.telescope("find_files", { no_ignore = true, default_text = line })()
      end
      local find_files_with_hidden = function()
        local line = action_state.get_current_line()
        Util.telescope("find_files", { hidden = true, default_text = line })()
      end
      local open_diff_commit = function()
        -- Open in diffview
        local entry = action_state.get_selected_entry()
        -- close Telescope window properly prior to switching windows
        actions.close(vim.api.nvim_get_current_buf())
        vim.cmd(("DiffviewOpen %s^!"):format(entry.value))
      end
      local open_diff_branch = function()
        -- Open in diffview
        local entry = action_state.get_selected_entry()
        -- close Telescope window properly prior to switching windows
        actions.close(vim.api.nvim_get_current_buf())
        vim.cmd(("DiffviewOpen %s.."):format(entry.value))
      end

      return {
        defaults = {
          prompt_prefix = " ",
          path_display = { "truncate" },
          selection_caret = " ",
          -- open files in the first window that is an actual file.
          -- use the current window if no other window is available.
          get_selection_window = function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == "" then
                return win
              end
            end
            return 0
          end,
          preview = {
            filesize_limit = 1, -- Mb
          },
          layout_strategy = "horizontal",
          layout_config = {
            width = 0.8,
            horizontal = {
              mirror = false,
              prompt_position = "top",
            },
          },
          sorting_strategy = "ascending",
          results_title = false,
          dynamic_preview_title = true,
          mappings = {
            i = {
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
              ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
            },
            n = {
              ["q"] = actions.close,
              ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
            },
          },
        },
        pickers = {
          find_files = {
            path_display = Util.telescope.filename_first, -- see https://github.com/nvim-telescope/telescope.nvim/issues/2014#issuecomment-1873229658
            mappings = {
              i = {
                ["<a-i>"] = find_files_no_ignore,
                ["<a-h>"] = find_files_with_hidden,
                ["<c-t>"] = open_with_trouble,
                ["<a-t>"] = open_selected_with_trouble,
              },
            },
          },

          git_files = {
            path_display = Util.telescope.filename_first, -- see https://github.com/nvim-telescope/telescope.nvim/issues/2014#issuecomment-1873229658
            mappings = {
              i = {
                ["<a-i>"] = find_files_no_ignore,
                ["<a-h>"] = find_files_with_hidden,
                ["<c-t>"] = open_with_trouble,
                ["<a-t>"] = open_selected_with_trouble,
              },
            },
          },

          buffers = {
            mappings = {
              i = {
                ["<C-d>"] = actions.delete_buffer + require("telescope.actions").move_to_top,
              },
            },
          },
          git_commits = {
            mappings = {
              i = {
                ["<C-o>"] = open_diff_commit,
              },
            },
          },
          git_bcommits = {
            mappings = {
              i = {
                ["<C-o>"] = open_diff_commit,
              },
            },
          },
          git_branches = {
            mappings = {
              i = {
                ["<C-o>"] = open_diff_branch,
              },
            },
          },
        },
      }
    end,
  },

  -- colorizer text like #RGB
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      filetypes = {
        "css",
        "javascript",
        html = { mode = "foreground" },
      },
    },
  },

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    opts = {
      signs = {
        -- icons / text used for a diagnostic
        error = Icons.diagnostics.Error,
        warning = Icons.diagnostics.Warn,
        hint = Icons.diagnostics.Hint,
        information = Icons.diagnostics.Info,
        other = "",
      },
    },
    keys = function()
      return {
        { "<leader>dd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
        { "<leader>dq", "<cmd>TroubleToggle quickfix<cr>", desc = "Diagnostic Quickfix List" },
        { "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        { "<leader>dl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      }
    end,
  },

  -- git signs highlights text that has changed since the list
  -- git commit, and also lets you interactively stage & unstage
  -- hunks in a commit.
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = function()
      return {
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        on_attach = function(buffer)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
          end

          -- stylua: ignore start
          map("n", "]h", gs.next_hunk, "Next Hunk")
          map("n", "[h", gs.prev_hunk, "Prev Hunk")
          map("n", "<leader>gd", function() gs.blame_line({ full = true }) end, "Git Blame (with diff)")
          map("n", "<leader>ga", gs.toggle_current_line_blame, "Toggle annotate with Git Blame")
        end,
      }
    end,
  },
}
