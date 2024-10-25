return {
  {
    "pearofducks/ansible-vim",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")

      -- Register ansible-lint as a diagnostic source
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.ansiblelint,  -- Ansible linting
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-null-ls.nvim" },
    config = function()
      require("mason").setup()
      require("mason-null-ls").setup({
        ensure_installed = { "ansible-lint" },
        automatic_installation = true,
      })
    end,
  }
}

