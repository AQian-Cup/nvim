return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.code_actions.gitsigns,
          require("none-ls.diagnostics.eslint_d")
        }
      })
    end,
    keys = {
      {
        "<leader>pf",
        function()
          vim.lsp.buf.format({ async = true })
        end,
        desc = "Run formatting with prettierd"
      }
    },
  },
}
