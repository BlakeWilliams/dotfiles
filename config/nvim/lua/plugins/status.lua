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

      local extract_color = require 'lualine.utils.utils'.extract_highlight_colors

      return {
        options = {
          icons_enabled = true,
          theme = 'auto',
          -- component_separators = { left = '', right = '' },
          -- section_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          component_separators = { left = '|', right = '|' },
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = false,
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
          lualine_y = {},
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
        tabline = {
          lualine_a = {
            {
              'tabs',
              mode = 1
            }
          },
          lualine_b = {},
          lualine_c = {},
          -- lualine_z = {'windows'},
          lualine_z = { 'windows' },
        },
        extensions = { netrw_ext }
      }
    end
  }
}
