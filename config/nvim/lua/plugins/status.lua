local icons = {
  modified = '✱',
  readonly = ''
}

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

        local filename = vim.fn.fnamemodify(path, ":t")
        local ext = vim.fn.fnamemodify(path, ":e")
        local icon, _ = require('nvim-web-devicons').get_icon(filename, ext, { default = true })
        if path == vim.fn.getcwd() then
          return '[No Name]'
        elseif vim.fn.isdirectory(full_path) == 0 and vim.bo.buftype ~= 'nofile' then
          if vim.bo.modified then
            path = path .. " " .. icons.modified
          end

          if vim.bo.modifiable == false or vim.bo.readonly then
            path = path .. " " .. icons.readonly
          end

          if icon then
            return icon .. " " .. path
          else
            return path
          end

        else
          if icon then
            return icon .. " " .. path
          else
            return path
          end
        end
      end

      local function rel_netrw()
        return make_rel(vim.b.netrw_curdir)
      end

      local function rel_file()
        return make_rel(vim.fn.expand('%:p'))
      end

      local function location()
        local line = vim.fn.line('.')
        local col = vim.fn.col('.')
        return string.format(' %d/%d', line, col)
      end

      local netrw_ext = {
        sections = {
          lualine_a = { function() return 'NETRW' end },
          lualine_c = { rel_netrw },
          lualine_z = { location },
        },
        filetypes = { 'netrw' }
      }

      local neotree_ext = {
        sections = {
          lualine_a = { function() return 'NEOTREE' end },
          lualine_c = {},
          lualine_y = { location },
        },
        filetypes = { 'neo-tree' }
      }

      local hidden_ext = {
        sections = {
          lualine_a = { function() return '' end },
          lualine_c = {},
          lualine_y = { },
        },
        filetypes = { 'alpha', 'TelescopePrompt' }
      }

      local extract_color = require 'lualine.utils.utils'.extract_highlight_colors

      return {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            -- 'neo-tree',
            -- 'netrw',
          },
          always_divide_middle = true,
          globalstatus = true,
        },

        sections = {
          lualine_a = { { 'mode', fmt = function(s) return modes[s] or s end } },
          lualine_b = { },
          lualine_c = {
            rel_file,
          },
          lualine_x = {
            {
              'diagnostics',
              diagnostics_color = {
                warn = { fg = extract_color("WarningMsg", "fg") },
                info = { fg = extract_color("Identifier", "fg") },
                hint = { fg = extract_color("String", "fg") },
                error = { fg = extract_color("ErrorMsg", "fg") },
              },
              sections = { 'error', 'warn', 'hint', 'info', },
              always_visible = false,
              symbols = {
                error = GlobalConfig.icons.Error,
                warn = GlobalConfig.icons.Warn,
                info = GlobalConfig.icons.Info,
                hint = GlobalConfig.icons.Hint,
              },
              sources = { 'nvim_lsp', },
            },
            'encoding'
          },
          lualine_y = { },
          lualine_z = { location }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { rel_file },
          lualine_x = { location },
          lualine_y = {},
          lualine_z = {}
        },
        extensions = { netrw_ext, neotree_ext, hidden_ext }
      }
    end
  },
  {
    'b0o/incline.nvim',
    event = 'VeryLazy',
    config = function()
      require('incline').setup({
        hide = {
          only_win = true
        }
      })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    opts = function()
      return {
        options = {
          mode = 'tabs',
          modified_icon = icons.modified,
          diagnostics = false,
          show_buffer_icons = false,
          show_close_icon = false,
          indicator = { style = "none" },
          always_show_bufferline = false,
          auto_toggle_bufferline = true,
        }
      }
    end
  },
}
