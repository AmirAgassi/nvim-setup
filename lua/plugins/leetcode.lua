return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",

    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- configuration goes here
    arg = "leetcode.nvim",
    lang = "python3", -- default language for new problems
    
    cn = { -- leetcode.cn
      enabled = false, -- enable leetcode.cn, if true then `lang` and `storage` must be set
      translator = true,
      translate_problems = true,
    },

    storage = {
      home = vim.fn.stdpath("data") .. "/leetcode",
      cache = vim.fn.stdpath("cache") .. "/leetcode",
    },

    logging = true,
    injector = {}, -- a table of injected files, see injector section below
    cache = {
      update_interval = 60 * 60 * 24 * 7, -- 7 days
    },

    console = {
      open_on_runcode = true, -- open console on run code
      dir = "row", -- "col" | "row"
      size = { -- depends on `console.dir`
        width = 0.9, -- between 0 and 1
        height = 0.75,
      },
      result = {
        size = "60%", -- between 0 and 1
      },
      testcase = {
        virt_text = true, -- show virtual text for testcase
        size = "40%", -- between 0 and 1
      },
    },

    description = {
      position = "left", -- "left" | "right" | "top" | "bottom"
      width = "40%", -- only for left/right position
      show_stats = true, -- show stats in description
    },

    hooks = {
      ---@type fun()[]
      ["enter"] = {},

      ---@type fun(question: lc.ui.Question)[]
      ["question_enter"] = {},

      ---@type fun()[]
      ["leave"] = {},
    },

    keys = {
      toggle = { "q" }, -- close any leetcode window
      confirm = { "<CR>" }, -- confirm selection

      reset_testcases = "r", -- reset testcases
      use_testcase = "U", -- use testcase for testing
      focus_testcases = "H", -- focus testcases window
      focus_result = "L", -- focus result window
    },

    ---@type boolean
    image_support = false, -- setting this to `true` will disable question description wrap
  },
  
  -- Custom keymaps for leetcode
  keys = {
    {
      "<leader>lq",
      "<cmd>Leet<cr>",
      desc = "Open Leetcode menu",
    },
    {
      "<leader>ll",
      "<cmd>Leet list<cr>",
      desc = "List Leetcode problems",
    },
    {
      "<leader>lr",
      "<cmd>Leet run<cr>",
      desc = "Run current solution",
    },
    {
      "<leader>ls",
      "<cmd>Leet submit<cr>",
      desc = "Submit current solution",
    },
    {
      "<leader>li",
      "<cmd>Leet info<cr>",
      desc = "Show problem info",
    },
    {
      "<leader>ld",
      "<cmd>Leet desc<cr>",
      desc = "Show problem description",
    },
    {
      "<leader>lc",
      "<cmd>Leet console<cr>",
      desc = "Open console",
    },
    {
      "<leader>lt",
      "<cmd>Leet tabs<cr>",
      desc = "Show leetcode tabs",
    },
  },
}