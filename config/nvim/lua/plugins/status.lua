local function progress()
  local cur = vim.fn.line('.')
  local total = vim.fn.line('$')

  return string.format('%2d%%%%', math.floor(cur / total * 100))
end

local modes = {
  ['NORMAL'] = 'N',
  ['O-PENDING'] = 'N?',
  ['INSERT'] = 'I',
  ['VISUAL'] = 'V',
  ['V-BLOCK'] = 'VB',
  ['V-LINE'] = 'VL',
  ['V-REPLACE'] = 'VR',
  ['REPLACE'] = 'R',
  ['COMMAND'] = '!',
  ['SHELL'] = 'SH',
  ['TERMINAL'] = 'T',
  ['EX'] = 'X',
  ['S-BLOCK'] = 'SB',
  ['S-LINE'] = 'SL',
  ['SELECT'] = 'S',
  ['CONFIRM'] = 'Y?',
  ['MORE'] = 'M',
}

return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 10001,

    dependencies = {
      { 'akinsho/bufferline.nvim', lazy = false },
    },

    opts = function()
      local function netrw()
        return vim.b.netrw_curdir
      end

      local function make_rel(full_path)
        local path = vim.fn.fnamemodify(full_path, ':.')

        if path == vim.fn.getcwd() then
          return '[No Name]'
        elseif path:match("^/") then
          if vim.bo.modified then
            path = path .. "[+]"
          end

          if vim.bo.modifiable == false or vim.bo.readonly then
            path = path .. "[-]"
          end

          return path
        else
          return path
        end
      end

      local function rel_netrw()
        return make_rel(vim.b.netrw_curdir)
      end

      local function rel_file()
        return make_rel(vim.fn.expand('%:p'))
      end

      local netrw_ext = {
        sections = {
          lualine_a = { function() return 'NETRW' end },
          lualine_c = { rel_netrw },
          lualine_z = { 'location' },
        },
        filetypes = { 'netrw' }
      }

      local neotree_ext = {
        sections = {
          lualine_a = { function() return 'NEOTREE' end },
          lualine_c = {},
          lualine_y = { 'location' },
        },
        filetypes = { 'neo-tree' }
      }

      local extract_color = require 'lualine.utils.utils'.extract_highlight_colors

      return {
        options = {
          icons_enabled = true,
          theme = 'auto',
          -- component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          -- section_separators = { left = '', right = '' },
          component_separators = { left = '┃', right = '┃' },
          disabled_filetypes = {
            -- 'neo-tree',
            -- 'netrw',
          },
          always_divide_middle = true,
          globalstatus = true,
        },

        sections = {
          lualine_a = { { 'mode', fmt = function(s) return modes[s] or s end } },
          lualine_b = {},
          lualine_c = { rel_file },
          lualine_x = {
            {
              'diagnostics',
              diagnostics_color = {
                warn = { fg = extract_color("WarningMsg", "fg") },
                info = { fg = extract_color("Identifier", "fg") },
                hint = { fg = extract_color("String", "fg") },
                error = { fg = extract_color("ErrorMsg", "fg") },
              },
              sections = { 'error', 'warn' },

              symbols = {
                error = GlobalConfig.icons.Error,
                warn = GlobalConfig.icons.Warn,
                info = GlobalConfig.icons.Info,
                hint = GlobalConfig.icons.Hint,
              },
              sources = { 'nvim_lsp', },
            },
            'filetype',
          },
          lualine_y = {
            { progress },
          },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { rel_file },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        extensions = { netrw_ext, neotree_ext }
      }
    end
  },
  {
    "akinsho/bufferline.nvim",
    -- event = "Lazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers to the Left" },
      { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
      { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
      { "[b",         "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
      { "]b",         "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
      { "[B",         "<cmd>BufferLineMovePrev<cr>",             desc = "Move buffer prev" },
      { "]B",         "<cmd>BufferLineMoveNext<cr>",             desc = "Move buffer next" },
    },
    opts = function(_, opts)
      local bufferline = require("bufferline")

      -- Function to adjust color brightness
      local function adjust_brightness(hex, percentage)
        local r = tonumber(hex:sub(2, 3), 16)
        local g = tonumber(hex:sub(4, 5), 16)
        local b = tonumber(hex:sub(6, 7), 16)

        r = math.min(255, math.max(0, r + percentage))
        g = math.min(255, math.max(0, g + percentage))
        b = math.min(255, math.max(0, b + percentage))

        return string.format("#%02X%02X%02X", r, g, b)
      end

      -- Function to determine if a color is light
      local function is_light_color(hex)
        local r = tonumber(hex:sub(2, 3), 16)
        local g = tonumber(hex:sub(4, 5), 16)
        local b = tonumber(hex:sub(6, 7), 16)
        -- Calculate relative luminance (standard formula)
        local luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return luminance > 127.5
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          local bg_color = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
          if not bg_color or bg_color == "" then
            return
          end

          local adjustment = is_light_color(bg_color) and -12 or 12
          local adjusted_color = adjust_brightness(bg_color, adjustment)

          vim.api.nvim_set_hl(0, "BufferLineFill", { bg = adjusted_color })
        end,
      })

      return {
        options = {
          mode = "tabs",
          indicator = {
            style = 'none'
          },
          diagnostics = "nvim_lsp",
          always_show_bufferline = false,
          diagnostics_indicator = function(_, _, diag)
            local ret = (diag.error and GlobalConfig.icons.Error .. diag.error .. " " or "")
                .. (diag.warning and GlobalConfig.icons.Warn .. diag.warning or "")
            return vim.trim(ret)
          end,
          offsets = {
            -- {
            --   filetype = "neo-tree",
            --   text = "Neo-tree",
            --   highlight = "Directory",
            --   text_align = "left",
            -- },
          },
        },
      }
    end
  },
  {
    'b0o/incline.nvim',
    lazy = false,
    config = function()
      local devicons = require('nvim-web-devicons')

      require('incline').setup({
        -- hide = {
        --   only_win = true,
        --   count_ignored = true,
        -- },
        ignore = {
          filetypes = { "neo-tree", "netrw" },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)

          local function get_diagnostic_label()
            local icons = { error = '', warn = '', info = '', hint = '' }
            local label = {}

            for severity, icon in pairs(GlobalConfig.icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then
                table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
                break
              end
            end

            if #label > 0 then
              table.insert(label, 1, { ' ' })
            end

            return label
          end

          local res = {
            { (ft_icon or '') .. ' ', guifg = ft_color,                                            guibg = 'none' },
            { filename .. ' ',        gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
          }

          if vim.bo[props.buf].modified then
            local green = vim.api.nvim_get_hl_by_name("Green", true).foreground
            table.insert(res, {
              ' ',
              guifg = string.format("#%06x", green),
            })
          end

          table.insert(res, get_diagnostic_label())

          return res
        end,
      })
    end,
  },
}
