---@class stormvim.util.telescope: lazyvim.util.telescope
local M = require("lazyvim.util.telescope")

M.filename_first = function(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then
    return tail
  end
  return string.format("%s\t\t%s", tail, parent)
end

return M
