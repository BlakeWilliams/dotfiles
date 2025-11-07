return {
  {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    cmd = { 'Telescope' },
    version = false,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        lazy = false,
        version = false,
        build = 'make',
        config = function()
          require("telescope").load_extension("fzf")
        end
      },
    },
    init = function()
      require("which-key").add({
        { "<leader>f", group = "File" },
        { "<leader>s", group = "Search" },
      })
    end,

    opts = function(_, opts)
      local actions = require("telescope.actions")
      return {
        prompt_prefix   = "",
        selection_caret = "",
        defaults        = {
          mappings = {
            i = {
              -- ["<esc>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-h>"] = function(prompt_bufnr)
                local current = require('telescope.actions.state').get_current_picker(prompt_bufnr)
                local hidden = current.finder.hidden
                current:refresh(current.finder, { hidden = not hidden })
              end,
            },
          },
          vim_grep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          }
        },
        pickers         = {
          find_files = {
            follow = true
          },
          colorscheme = {
            enable_preview = true,
            ignore_builtin = true,
          }
        },
        extensions      = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      }
    end,
    keys = {
      { "<C-p>",      "<cmd>Telescope find_files<cr>",                desc = "Find files" },
      { "<leader>b",  "<cmd>Telescope buffers<cr>",                   desc = "Find buffers" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "Find files" },
      { "<leader>/",  "<cmd>Telescope live_grep<cr>",                 desc = "Live grep" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",                 desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "Find Buffers" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>",                 desc = "Help tags" },
      { "<leader>fl", "<cmd>Telescope lsp_references<cr>",            desc = "LSP references" },
      { "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>",      desc = "LSP document symbols" },
      { "<leader>fq", "<cmd>Telescope quickfix<cr>",                  desc = "Quickfix" },
      { "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current buffer fuzzy find" },
      { "<leader>:",  "<cmd>Telescope command_history<cr>",           desc = "Command History" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                  desc = "Recent" },
      { "<leader>fs", "<cmd>Telescope git_status<CR>",                desc = "Status" },
      { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>",               desc = "Workspace Diagnostics" },
      { "<leader>fc", "<cmd>Telescope colorscheme<cr>",               desc = "Colors" },
    },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    lazy = true,
    dependencies = { 'nvim-telescope/telescope.nvim' },
    init = function()
      require("telescope").load_extension("ui-select")
    end,
  },
}
