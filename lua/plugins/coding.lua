return {

  -- change mappings for comment
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        ignore_blank_line = true,
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
      mappings = {
        -- Toggle comment on current line
        comment_line = "<A-/>",

        -- Toggle comment on visual selection
        comment_visual = "<A-/>",
      },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
}
