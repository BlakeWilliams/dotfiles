return {
  {
    'folke/which-key.nvim',
    opts = {
      preset    = "helix",
      marks     = true,
      registers = true,
      spelling  = { enabled = true },
      show_help = false,

      filter    = function(mapping)
        -- filter out fold mappings since they're not useful
        if mapping.lhs:sub(1, 1) and mapping.desc and mapping.desc:lower():match("fold") then
          return false
        end

        return true
      end,

      spec      = {
        { "<leader><space>", "<cmd>noh<cr>", desc = "Clear highlights" },
        { "<leader>h",       "<C-w>h",       desc = "Move left",                    mode = "n" },
        { "<leader>j",       "<C-w>j",       desc = "Move below",                   mode = "n" },
        { "<leader>k",       "<C-w>k",       desc = "Move above",                   mode = "n" },
        { "<leader>l",       "<C-w>l",       desc = "Move right",                   mode = "n" },
        { "<leader>c",       group = "code" },
        { "Y",               "y$",           desc = "Yank line" },

        { "gp",              "`[v`]",        desc = "Select last inserted text",    mode = "n" },
        { "<2-LeftMouse>",   "*#",           desc = "Search for word under cursor", mode = "n", hidden = true },
      },
    }
  },
}
