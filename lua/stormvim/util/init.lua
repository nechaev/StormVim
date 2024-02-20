local LazyUtil = require("lazy.core.util")

local M = require("lazyvim.util.init")

---@type table<string, string|string[]>
local deprecated = {
  get_clients = "lsp",
  on_attach = "lsp",
  on_rename = "lsp",
  root_patterns = { "root", "patterns" },
  get_root = { "root", "get" },
  float_term = { "terminal", "open" },
  toggle_diagnostics = { "toggle", "diagnostics" },
  toggle_number = { "toggle", "number" },
  fg = "ui",
}

setmetatable(M, {
  __index = function(t, k)
    if LazyUtil[k] then
      return LazyUtil[k]
    end
    local dep = deprecated[k]
    if dep then
      local mod = type(dep) == "table" and dep[1] or dep
      local key = type(dep) == "table" and dep[2] or k
      M.deprecate([[require("lazyvim.util").]] .. k, [[require("lazyvim.util").]] .. mod .. "." .. key)
      ---@diagnostic disable-next-line: no-unknown
      t[mod] = require("lazyvim.util." .. mod) -- load here to prevent loops
      return t[mod][key]
    end
    ---@diagnostic disable-next-line: no-unknown
    local status, module = pcall(require, "stormvim.util." .. k)
    if not status then
      t[k] = require("lazyvim.util." .. k)
    else
      t[k] = module
    end
    return t[k]
  end,
})

return M
