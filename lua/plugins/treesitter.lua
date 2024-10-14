return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "typescript", "css", "scss", "vue" },
        highlight = { enable = true, additional_vim_regex_highlighting = false },
      })
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldenable = false
      vim.wo.foldlevel = 99
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    keys = {
      {
        "<leader>jc",
        function()
          require("treesitter-context").go_to_context(vim.v.count1)
        end,
        desc = "Go to context"
      },
    },
    lazy = false
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  }
}
