return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute()
        end,
        desc = "Explorer NeoTree",
      },
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "NeoTree",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
    opts = {
      close_if_last_window = false,
      sources = { "filesystem", "buffers", "git_status" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        hijack_netrw_behavior = 'disabled',
        filtered_items = {
          hide_dotfiles = false
        },
        always_show_by_pattern = {
          "env*",
        },
      },
      window = {
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["<space>"] = "none",
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "Copy Path to Clipboard",
          },
          ["/"] = "noop",
          ["P"] = { "toggle_preview", config = { use_float = false } },
        },
      },
      enable_diagnostics = true,
      hide_root_node = true,
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
          provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
            if node.type == "file" or node.type == "terminal" then
              local success, web_devicons = pcall(require, "nvim-web-devicons")
              local name = node.type == "terminal" and "terminal" or node.name
              if success then
                local devicon, hl = web_devicons.get_icon(name)
                icon.text = "" -- devicon or icon.text
                icon.highlight = hl or icon.highlight
              end
            end
          end,
        },
        indent = {
          with_expanders = false,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        git_status = {
          symbols = {
            added     = "M",
            modified  = "M",
            -- Status type
            untracked = "U",
            ignored   = "I",
            unstaged  = "",
            staged    = "",
            conflict  = " ",
          },
        },
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)

      vim.api.nvim_exec([[hi! link NeoTreeNormal normal]], false)
      vim.api.nvim_exec([[hi! link NeoTreeNormalNC normal]], false)
      vim.api.nvim_exec([[hi! link NeoTreeEndOfBuffer normal]], false)
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_exec([[hi! link NeoTreeNormal normal]], false)
          vim.api.nvim_exec([[hi! link NeoTreeNormalNC normal]], false)
          vim.api.nvim_exec([[hi! link NeoTreeEndOfBuffer normal]], false)
        end,
      })
    end
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      default = true,
      override = {
        default_icon = {
          icon = "",
        }
      },
    },
    -- config = function(_, opts)
    --   local devicons = require("nvim-web-devicons")
    --   devicons.setup(opts)
    --
    --   for ext, icon_data in pairs(devicons.get_icons()) do
    --     devicons.set_icon({
    --       [ext] = {
    --         icon = "",
    --         color = icon_data.color,
    --         name = icon_data.name,
    --       }
    --     })
    --   end
    -- end,
  },
}
