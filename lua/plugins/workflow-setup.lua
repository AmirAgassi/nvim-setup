-- Custom workflow setup: Explorer + Terminal with cursor-agent
return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          "<leader>w",
          group = "workflow",
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>ws",
        function()
          -- Open file explorer using snacks
          require("snacks").explorer()
          
          -- Wait a moment for the explorer to open
          vim.defer_fn(function()
            -- Split vertically and open terminal on the right
            vim.cmd("vsplit")
            vim.cmd("wincmd l") -- Move to right window
            vim.cmd("terminal cursor-agent")
            
            -- Enter insert mode in terminal
            vim.cmd("startinsert")
            
            -- Optional: Switch back to the file explorer
            -- vim.cmd("wincmd h")
          end, 200)
        end,
        desc = "Setup Workspace (Explorer + Terminal)",
      },
      {
        "<leader>wt",
        function()
          -- Alternative: Just open terminal with cursor-agent in vertical split
          vim.cmd("vsplit")
          vim.cmd("wincmd l")
          vim.cmd("terminal cursor-agent")
          vim.cmd("startinsert")
        end,
        desc = "Open Terminal with cursor-agent",
      },
    },
  },
}