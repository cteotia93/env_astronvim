return{
  -- Install telescope.nvim and dependencies
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",  -- You can specify the latest stable version
    dependencies = { { "nvim-lua/plenary.nvim" } },  -- Required dependency
    config = function()
      require('telescope').setup {
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--no-ignore',  -- Include .gitignore files in search results
          },
          prompt_prefix = "> ",
          selection_caret = "> ",
          path_display = { "smart" },
        }
      }
    end
  }
}

