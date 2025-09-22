return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>gg",
        "<cmd>LazyGit<CR>",
        desc = "LazyGit (project)",
      },
      {
        "<leader>gG",
        "<cmd>LazyGitCurrentFile<CR>",
        desc = "LazyGit (current file)",
      },
    },
    init = function()
      vim.g.lazygit_floating_window_winblend = 0
      vim.g.lazygit_floating_window_scaling_factor = 0.95
      vim.g.lazygit_floating_window_border_chars = { "+", "-", "+", "|", "+", "-", "+", "|" }
      vim.g.lazygit_use_neovim_remote = 0
    end,
  },
}
