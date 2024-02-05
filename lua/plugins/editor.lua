return {
	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		keys = {
			{ "<C-e>e", ":Neotree toggle<CR>", desc = "Explorer NeoTree" },
			{ "<C-e>g", ":Neotree git_status<CR>", desc = "Explorer git status" },
		},
		opts = {
			sources = { "filesystem", "git_status" },
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

			telescope.setup({
				defaults = {
					path_display = { "truncate " },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
			})

			telescope.load_extension("fzf")

			-- set keymaps
			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "<C-f>f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
			keymap.set("n", "<C-f>s", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
			keymap.set("n", "<C-f>b", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
			keymap.set("n", "<C-f>g", "<cmd>Telescope gir_commits<cr>", { desc = "Find commits" })
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
			{ "<leader>dd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
			{ "<leader>dq", "<cmd>TroubleToggle quickfix<cr>", desc = "Diagnostic Quickfix List" },
		},
	},

	-- colorizer text like #RGB
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
}
