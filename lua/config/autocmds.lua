-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-setup workspace on Neovim startup
vim.api.nvim_create_augroup("WorkspaceSetup", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  group = "WorkspaceSetup",
  callback = function()
    -- Only auto-setup if no arguments were passed (i.e., plain `nvim` command)
    if vim.fn.argc() == 0 then
      vim.defer_fn(function()
        -- Open snacks explorer
        require("snacks").explorer()
        
        -- Wait a moment then setup terminal
        vim.defer_fn(function()
          -- Split vertically and open terminal on the right
          vim.cmd("vsplit")
          vim.cmd("wincmd l") -- Move to right window
          vim.cmd("terminal cursor-agent")
          vim.cmd("startinsert") -- Enter insert mode in terminal
        end, 300)
      end, 500) -- Wait for LazyVim to fully load
    end
  end,
  desc = "Auto-setup workspace: Explorer + cursor-agent terminal",
})
