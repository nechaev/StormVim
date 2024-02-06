vim.api.nvim_create_user_command(
    'Config',
    function ()
        require('telescope.builtin').find_files({
          cwd="~/.config/nvim",
          prompt_title = "Config",
          search_file = "*.lua"
        })
    end,
    {}
)
