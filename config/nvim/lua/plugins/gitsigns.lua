return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',

    opts = {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        -- delete       = { text = '│' },
        -- topdelete    = { text = '│' },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = '│' },
      },
      numhl = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = true,
        virt_text_priority = 100,
        use_focus = true,
      },

      on_attach = function()
        local gitsigns = require('gitsigns')
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end, "Next hunk")

        map('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end, "Prev hunk")

        map('n', '<leader>gp', gitsigns.toggle_current_line_blame, "Toggle current line blame")
        map('n', '<leader>gl', function() gitsigns.blame_line { full = true } end, "Show blame")
      end
    },
  }
}
