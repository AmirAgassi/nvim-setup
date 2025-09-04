-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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
