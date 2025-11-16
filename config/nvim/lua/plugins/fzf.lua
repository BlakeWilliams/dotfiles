return {
  {
    "ibhagwan/fzf-lua",
    version = "*",
    cmd = { "FzfLua" },
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    init = function()
      require("which-key").add({
        { "<leader>f", group = "File" },
        { "<leader>s", group = "Search" },
      })

      require('fzf-lua').register_ui_select()
      -- fzf.register_ui_select({
      --   winopts = { height = 0.4, width = 0.6 },
      -- })
    end,

    opts = {
      files = {
        cwd_prompt = false,
      },
      winopts = {
        preview = {
          default = "bat",
        },
      },
    },

    keys = {
      -- Files and buffers
      { "<C-p>",      "<cmd>FzfLua files<cr>",          desc = "Find files" },
      { "<leader>ff", "<cmd>FzfLua files<cr>",          desc = "Find files" },
      { "<leader>b",  "<cmd>FzfLua buffers<cr>",        desc = "Find buffers" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>",        desc = "Find buffers" },

      -- Text search
      { "<leader>/",  "<cmd>FzfLua live_grep<cr>",      desc = "Live grep" },
      { "<leader>ft", "<cmd>FzfLua live_grep<cr>",      desc = "Find text via live grep" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>",      desc = "Live grep" },
      { "<leader>fz", "<cmd>FzfLua blines<cr>",         desc = "Current buffer fuzzy find" },

      -- Git
      { "<leader>fc", "<cmd>FzfLua git_commits<cr>",    desc = "Find commits" },
      { "<leader>fs", "<cmd>FzfLua git_status<cr>",     desc = "Git status" },

      -- History and quickfix
      { "<leader>f:", "<cmd>FzfLua command_history<cr>", desc = "Command history" },
      { "<leader>fr", "<cmd>FzfLua oldfiles<cr>",        desc = "Recent files" },
      { "<leader>fq", "<cmd>FzfLua quickfix<cr>",        desc = "Quickfix" },

      -- Diagnostics
      { "<leader>fd", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace diagnostics" },

      -- Search
      { "<leader>sh", "<cmd>FzfLua help_tags<cr>",      desc = "Help tags" },
      { "<leader>sr", "<cmd>FzfLua registers<cr>",      desc = "Search registers" },
      { "<leader>sc", "<cmd>FzfLua commands<cr>",       desc = "Search commands" },
      { "<leader>sm", "<cmd>FzfLua man_pages<cr>",      desc = "Search man pages" },

      -- Other
      { "<leader>sp", "<cmd>FzfLua builtin<cr>",        desc = "FzfLua pickers" },
      { "<leader>fC", "<cmd>FzfLua colorschemes<cr>",   desc = "Colorschemes" },
    },
  },
}

