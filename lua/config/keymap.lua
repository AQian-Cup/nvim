-- Complete MacOS Neovim Keymap Configuration

-- Helper function for mapping
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- MacOS-style Command key mappings

-- Scrolling
map("n", "<D-e>", "<C-e>", { desc = "Scroll down" })
map("n", "<D-y>", "<C-y>", { desc = "Scroll up" })
map("n", "<D-d>", "<C-d>", { desc = "Scroll half-page down" })
map("n", "<D-u>", "<C-u>", { desc = "Scroll half-page up" })
map("n", "<D-f>", "<C-f>", { desc = "Scroll full-page down" })
map("n", "<D-b>", "<C-b>", { desc = "Scroll full-page up" })

-- Jumping
map("n", "<D-o>", "<C-o>", { desc = "Jump to older position" })
map("n", "<D-i>", "<C-i>", { desc = "Jump to newer position" })

-- Word movement
map("n", "<D-Left>", "b", { desc = "Move backward by word" })
map("n", "<D-Right>", "w", { desc = "Move forward by word" })

-- Line jump
map("n", "<D-6>", "<C-^>", { desc = "Jump to alternate file" })

-- Window navigation
map("n", "<D-w>h", "<C-w>h", { desc = "Move to left window" })
map("n", "<D-w>j", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<D-w>k", "<C-w>k", { desc = "Move to top window" })
map("n", "<D-w>l", "<C-w>l", { desc = "Move to right window" })

-- Additional useful MacOS-style shortcuts
map("n", "<D-/>", ":noh<CR>", { desc = "Clear search highlighting" })

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
