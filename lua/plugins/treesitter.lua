return {
  -- Install nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup {
        -- List of parsers to install or "all"
        ensure_installed = { "lua", "python", "javascript", "html", "css" },  -- Modify based on your needs
        highlight = {
          enable = true,               -- Enable syntax highlighting
        },
        indent = {
          enable = true                -- Enable automatic indentation
        }
      }
    end
  },
}

