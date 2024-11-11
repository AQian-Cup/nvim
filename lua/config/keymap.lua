-- Complete MacOS Neovim Keymap Configuration

-- Helper function for mapping
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local modes = { 'n', 'i', 'v' }
local keys = {
  -- 字母键
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
  -- 数字键
  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
  -- 特殊键
  '[', ']', ';', "'", ',', '.', '/', '\\', '-', '='
}

for _, mode in ipairs(modes) do
  for _, key in ipairs(keys) do
    map(mode, '<D-' .. key .. '>', '<C-' .. key .. '>')
  end
end

-- Copy and paste (for Neovide)
if vim.g.neovide == true then
  vim.keymap.set({ "n", "x" }, "<D-c>", '"+y', { desc = "Copy to system clipboard" })
  vim.keymap.set({ "n", "x" }, "<D-v>", '"+p', { desc = "Paste from system clipboard" })
end

-- Working directory management
vim.keymap.set('n', '<leader>wk', function()
  vim.cmd('cd %:p:h')
  print(vim.fn.getcwd())
end, { desc = "Set current file directory as working directory" })

vim.keymap.set('n', '<leader>-', function()
  vim.cmd('cd -')
  print(vim.fn.getcwd())
end, { desc = "Jump back to previous working directory" })

-- You can add more custom keymaps here
