return {
  { "ellisonleao/gruvbox.nvim",    lazy = false,  priority = 1000, opts = {} },
  { 'echasnovski/mini.hipatterns', version = '*', config = true },
  {
    "OXY2DEV/helpview.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    }
  }
}
