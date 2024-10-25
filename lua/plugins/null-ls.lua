return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")

      -- Register ansible-lint with null-ls
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.ansiblelint,  -- ansible-lint integration
        },
      })
  end,
}
