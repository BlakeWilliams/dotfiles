
require("which-key").setup({
  marks = true,
  registers = true,
  spelling = { enabled = true },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "<80><fc> <80><fd>"}, -- hide mapping boilerplate
  window = { border = "none", winblend = 0 },
  key_labels = {
    ["<2-LeftMouse"] = "CLICK"
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<TAB>"] = "TAB",
    -- ["<S-TAB>"] = "S-TAB",
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  show_help = false
})

require("which-key").register({
    ["d"] = {
      s = "Surround",
      ["<2-LeftMouse>"] = "which_key_ignore",
      ["^P"] = "which_key_ignore",
    },

    ["c"] = {
      s = "Surround",
      S = "Surround",
    },


}, opts)
