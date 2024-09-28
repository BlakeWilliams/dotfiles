return {
  {
    'junegunn/fzf.vim',

    dependencies = {
      { 'junegunn/fzf' }
    },

    cmd = {
      'Files',
      'GitFiles',
      'Buffers',
      'History',
      'BLines',
      'Rg',
      'Tags',
      'Marks',
      'OldFiles',
      'Quickfix',
      'Windows',
      'Colors',
      'Commands',
      'BLines',
      'Commands',
    },

    keys = {
      { "<C-p>", "<cmd>Files<cr>", desc = "Find files" },
      { "<leader>f", "<cmd>WhichKey <leader>f", desc = "FZF" },
      { "<leader>ff", "<cmd>RG<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>GitFiles<cr>", desc = "Find git files" },
      { "<leader>fb", "<cmd>Buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>History<cr>", desc = "Find history" },
      { "<leader>fl", "<cmd>BLines<cr>", desc = "Find lines" },
      { "<leader>fr", "<cmd>Rg<cr>", desc = "Find rg" },
      { "<leader>ft", "<cmd>Tags<cr>", desc = "Find tags" },
      { "<leader>fm", "<cmd>Marks<cr>", desc = "Find marks" },
      { "<leader>fo", "<cmd>OldFiles<cr>", desc = "Find old files" },
      { "<leader>fq", "<cmd>Quickfix<cr>", desc = "Find quickfix" },
      { "<leader>fw", "<cmd>Windows<cr>", desc = "Find windows" },
      { "<leader>fc", "<cmd>Colors<cr>", desc = "Find colors" },
      { "<leader>fd", "<cmd>Commands<cr>", desc = "Find commands" },
      { "<leader>fs", "<cmd>BLines<cr>", desc = "Find lines" },
      { "<leader>fx", "<cmd>Commands<cr>", desc = "Find commands" },
    },

    init = function()
      local function build_quickfix_list(lines)
        vim.fn.setqflist(vim.fn.map(vim.fn.copy(lines), function(val) return { filename = val } end))
        vim.cmd('copen')
        vim.cmd('cc')
      end

      vim.g.fzf_action = {
        ['ctrl-q'] = build_quickfix_list,
        ['ctrl-t'] = 'tab split',
        ['ctrl-x'] = 'split',
        ['ctrl-v'] = 'vsplit'
      }
    end,

    setup = function()
      -- vim.g.fzf_layout = { down = '~40%' }
      -- vim.g.fzf_action = {
      --   ['ctrl-t'] = 'tab split',
      --   ['ctrl-x'] = 'split',
      --   ['ctrl-v'] = 'vsplit',
      -- }
      local function ripgrep_fzf(query, fullscreen)
        local command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
        local initial_command = string.format(command_fmt, vim.fn.shellescape(query))
        local reload_command = string.format(command_fmt, '{q}')
        local spec = { options = { '--phony', '--query', query, '--bind', 'change:reload:' .. reload_command } }
        vim.call('fzf#vim#grep', initial_command, 1, vim.call('fzf#vim#with_preview', spec), fullscreen)
      end

      vim.api.nvim_create_user_command('RG', function(opts)
        ripgrep_fzf(opts.args, opts.bang == true and 1 or 0)
      end, { nargs = '*', bang = true })
    end
  },
}
