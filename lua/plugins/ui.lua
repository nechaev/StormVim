return {
  	-- better vim.ui
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      	---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
    	---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.input = function(...)
      require("lazy").load({ plugins = { "dressing.nvim" } })
      return vim.ui.input(...)
    end
  end,
  },

	{
		"akinsho/bufferline.nvim",
		version = "*",
		opts = {
			options = {
				offsets = {
					{
						filetype = "neo-tree",
						text = "Files",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd("BufAdd", {
				callback = function()
					vim.schedule(function()
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	},

  	-- statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status") -- to configure lazy pending updates count
      local function spaces()
        return vim.opt.shiftwidth:get() .. ' spaces'
      end
      -- configure lualine with modified theme
      lualine.setup({
        options = {
          component_separators = { left = '', right = ''},
          disabled_filetypes = {     -- Filetypes to disable lualine for.
              statusline = {'neo-tree'},       -- only ignores the ft for statusline.
              winbar = {},           -- only ignores the ft for winbar.
          },
          globalstatus = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {
          },
          lualine_c = {
            {
              'filename',
              file_status = true, -- Displays file status (readonly status, modified status)
              path = 1,           -- Relative path
              symbols = {
                modified = '',      -- Text to show when the file is modified.
                readonly = '',      -- Text to show when the file is non-modifiable or readonly.
                unnamed = '[No Name]', -- Text to show for unnamed buffers.
                newfile = '󰎔',     -- Text to show for newly created file before first write
              }
            },
          },
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = "#ff9e64" },
            },
            'location',
            'encoding',
            spaces,
          },
          lualine_y = {'branch'},
          lualine_z = {'progress'},
        }
      })
    end,
  },

	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		main = "ibl",
	},

	-- Active indent guide and indent text objects. When you're browsing
	-- code, this highlights the current level of indentation, and animates
	-- the highlighting.
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
	},

	-- Displays a popup with possible key bindings of the command you started typing
	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },

  -- diagostic bar
  {
    'b0o/incline.nvim',
    opts = {},
    -- Optional: Lazy load Incline
    event = "BufReadPre",
    config = function()
			require("incline").setup({
				render = function(props)
          local function get_diagnostic_label()
            local icons = { error = '', warn = '', info = '󰋼', hint = "" }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              table.insert(label, { icon .. ' ' .. n .. ' ', group = 'DiagnosticSign' .. severity })
            end
            return label
          end
          return {
            { get_diagnostic_label() },
          }
				end,
			})
		end,
  },
}
