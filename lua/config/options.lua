-- Neovide config
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_particle_lifetime = 1.5
vim.g.neovide_cursor_vfx_particle_density = 8.0
vim.o.guifont = "SF Mono:h16"
vim.g.neovide_hide_mouse_when_typing = true

-- Theme
vim.opt.termguicolors = true
vim.opt.background = "light" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- input
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- mouse
vim.opt.mouse = ""
-- search
vim.opt.hlsearch = true

-- cmdline
vim.opt.cmdheight = 1

vim.o.scrolloff = 5
