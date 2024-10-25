-- lua/user/plugins/catppuccin.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      -- Load the Catppuccin theme
      require("catppuccin").setup({
        -- Optional: Theme customization
        flavour = "frappe", -- Can be "latte", "frappe", "macchiato", "mocha"
      })

      -- Set the colorscheme to Catppuccin
      vim.cmd.colorscheme("catppuccin")
    end,
    dependencies = {
      -- Ensure nvim-web-devicons is loaded after the theme
      {
        "nvim-tree/nvim-web-devicons",
        config = function()
          -- Optionally configure nvim-web-devicons if needed
          require("nvim-web-devicons").setup({
            -- your config here (optional)
            default = true,
          })
        end
      }
    }
  }
}

