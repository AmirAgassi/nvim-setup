-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable code folding by default
vim.opt.foldenable = false
vim.opt.foldmethod = "manual"
vim.opt.foldcolumn = "0"

-- If folding is ever toggled on, start fully open
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
