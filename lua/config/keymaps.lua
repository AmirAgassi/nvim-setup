-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap <Tab> to accept Codeium suggestion in insert mode
-- This overrides LazyVim's default mapping that comments with \<Tab>
-- Falls back to regular Tab when no suggestion is shown
vim.keymap.set("i", "<Tab>", function()
  return vim.fn['codeium#Accept']()
end, { expr = true, silent = true, desc = "Codeium Accept" })

-- Quick workspace setup: Explorer + Terminal with cursor-agent
vim.keymap.set("n", "<leader>qa", function()
  -- Open snacks explorer (space + e equivalent)
  require("snacks").explorer()
  
  -- Wait a moment then setup terminal
  vim.defer_fn(function()
    -- Split vertically (space + | equivalent)
    vim.cmd("vsplit")
    vim.cmd("wincmd l") -- Move to right window
    vim.cmd("terminal cursor-agent")
    vim.cmd("startinsert") -- Enter insert mode in terminal
  end, 200)
end, { desc = "Quick setup: Explorer + cursor-agent terminal" })

-- Alternative: Just cursor-agent terminal in vertical split
vim.keymap.set("n", "<leader>qt", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
  vim.cmd("terminal cursor-agent")
  vim.cmd("startinsert")
end, { desc = "Quick cursor-agent terminal" })

vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")

-- Force LazyGit command to use the floating window from lazygit.nvim instead of Snacks
vim.keymap.set("n", "<leader>gg", function()
  vim.cmd("LazyGit")
end, { desc = "LazyGit (float)", remap = false })

vim.keymap.set("n", "<leader>gG", function()
  vim.cmd("LazyGitCurrentFile")
end, { desc = "LazyGit Current File (float)", remap = false })
