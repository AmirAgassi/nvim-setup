return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts = opts or {}
      opts.terminal = opts.terminal or {}
      opts.terminal.win = vim.tbl_deep_extend("force", {
        position = "right",
        width = 0.38,
      }, opts.terminal.win or {})
      return opts
    end,
    keys = function(_, keys)
      table.insert(keys, {
        "<leader>ac",
        function()
          Snacks.terminal.toggle({ "codex" }, {
            win = {
              position = "right",
              width = 0.38,
            },
            start_insert = true,
          })
        end,
        desc = "Toggle Codex terminal",
      })
      return keys
    end,
  },
}
