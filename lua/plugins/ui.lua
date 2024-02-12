local Icons = require("lazyvim.config").icons
return {

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local lazy_status = require("lazy.status") -- to configure lazy pending updates count
      local function spaces()
        return vim.opt.shiftwidth:get() .. " spaces"
      end
      return {
        options = {
          component_separators = { left = "", right = "" },
          disabled_filetypes = { -- Filetypes to disable lualine for.
            statusline = { "neo-tree" }, -- only ignores the ft for statusline.
            winbar = {}, -- only ignores the ft for winbar.
          },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {},
          lualine_c = {
            {
              "filename",
              file_status = true, -- Displays file status (readonly status, modified status)
              path = 1, -- Relative path
              symbols = {
                modified = "", -- Text to show when the file is modified.
                readonly = "", -- Text to show when the file is non-modifiable or readonly.
                unnamed = "[No Name]", -- Text to show for unnamed buffers.
                newfile = "󰎔", -- Text to show for newly created file before first write
              },
            },
          },
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = "#ff9e64" },
            },
            "location",
            "encoding",
            spaces,
          },
          lualine_y = { "branch" },
          lualine_z = { "progress" },
        },
      }
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
 .d8888b.  888                                 888     888 8888888 888b     d888 
d88P  Y88b 888                                 888     888   888   8888b   d8888 
Y88b.      888                                 888     888   888   88888b.d88888 
 "Y888b.   888888 .d88b.  888d888 88888b.d88b. Y88b   d88P   888   888Y88888P888 
    "Y88b. 888   d88""88b 888P"   888 "888 "88b Y88b d88P    888   888 Y888P 888 
      "888 888   888  888 888     888  888  888  Y88o88P     888   888  Y8P  888 
Y88b  d88P Y88b. Y88..88P 888     888  888  888   Y888P      888   888   "   888 
 "Y8888P"   "Y888 "Y88P"  888     888  888  888    Y8P     8888888 888       888 
                                                                                 
                                                                                 
                                                                                 
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
            { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
            { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",                                      desc = " Find text",       icon = "󱄽 ", key = "g" },
            { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },

  -- diagostic bar
  {
    "b0o/incline.nvim",
    opts = {},
    -- Optional: Lazy load Incline
    event = "BufReadPre",
    config = function()
      require("incline").setup({
        render = function(props)
          local function get_diagnostic_label()
            local icons = {
              error = Icons.diagnostics.Error,
              warn = Icons.diagnostics.Warn,
              info = Icons.diagnostics.Info,
            }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
            end
            return { { label } }
          end
          local function get_file_name()
            local bufname = vim.api.nvim_buf_get_name(props.buf)
            local filename = vim.fn.fnamemodify(bufname, ":t")
            local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)
            return {
              { filetype_icon, guifg = color },
              { " " },
              { filename },
            }
          end
          --return { { table.tostring(props) .. " | " .. vim.api.nvim_win_get_number(0) } }
          if props.focused then
            return get_diagnostic_label()
          else
            return get_file_name()
          end
        end,
      })
    end,
  },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        diagnostics = "",
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
  },
}
