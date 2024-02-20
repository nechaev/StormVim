-- Add any additional autocmds here
-- Fix indent for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- for improving telescope results
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

vim.api.nvim_create_user_command("Config", function()
  require("telescope.builtin").find_files({
    cwd = "~/.config/nvim",
    prompt_title = "Config",
    search_file = "*.lua",
  })
end, {})
