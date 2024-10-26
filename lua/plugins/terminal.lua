return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    autochdir = true,
    shade_terminals = false,
    direction = 'float',
  },
  keys = {
    { '<leader>tt', "<cmd>ToggleTerm<cr>", desc = 'Toggle Terminal' },
    { '<esc>',      "<cmd>ToggleTerm<cr>", desc = 'Toggle Terminal', mode = "t", },
  }
}
