local kind_icons = {
  Array         = " ",
  Boolean       = "󰨙 ",
  Class         = " ",
  Codeium       = "󰘦 ",
  Color         = " ",
  Control       = " ",
  Collapsed     = " ",
  Constant      = "󰏿 ",
  Constructor   = " ",
  Copilot       = " ",
  Enum          = " ",
  EnumMember    = " ",
  Event         = " ",
  Field         = " ",
  File          = " ",
  Folder        = " ",
  Function      = "󰊕 ",
  Interface     = " ",
  Key           = " ",
  Keyword       = " ",
  Method        = "󰊕 ",
  Module        = " ",
  Namespace     = "󰦮 ",
  Null          = " ",
  Number        = "󰎠 ",
  Object        = " ",
  Operator      = " ",
  Package       = " ",
  Property      = " ",
  Reference     = " ",
  Snippet       = "󱄽 ",
  String        = " ",
  Struct        = "󰆼 ",
  Supermaven    = " ",
  TabNine       = "󰏚 ",
  Text          = " ",
  TypeParameter = " ",
  Unit          = " ",
  Value         = " ",
  Variable      = "󰀫 ",
}

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  callback = function()
    local links = {
      CmpItemKind            = "Pmenu",
      CmpItemAbbr            = "Pmenu",
      CmpItemAbbrMatch       = "Search",
      CmpItemMenu            = "Comment",

      CmpItemKindText        = "Identifier",
      CmpItemKindMethod      = "Function",
      CmpItemKindFunction    = "Function",
      CmpItemKindConstructor = "Type",
      CmpItemKindField       = "Identifier",
      CmpItemKindVariable    = "Identifier",
      CmpItemKindClass       = "Type",
      CmpItemKindInterface   = "Type",
      CmpItemKindModule      = "PreProc",
      CmpItemKindProperty    = "Identifier",
      CmpItemKindUnit        = "Number",
      CmpItemKindValue       = "String",
      CmpItemKindEnum        = "Type",
      CmpItemKindKeyword     = "Keyword",
      CmpItemKindSnippet     = "Special",
      CmpItemKindColor       = "Number",
      CmpItemKindFile        = "Directory",
      CmpItemKindReference   = "Identifier",
      CmpItemKindFolder      = "Directory",
      CmpItemKindEnumMember  = "Constant",
      CmpItemKindConstant    = "Constant",
      CmpItemKindStruct      = "Structure",
      CmpItemKindEvent       = "Type",
      CmpItemKindOperator    = "Operator",
      CmpItemKindTypeParameter = "Type",

      -- custom kinds if you use them
      CmpItemKindCopilot     = "String",
      CmpItemKindCodeium     = "Special",
      CmpItemKindTabNine     = "Special",
    }

    for group, link in pairs(links) do
      vim.api.nvim_set_hl(0, group, { link = link })
    end
  end,
})

return {
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },

    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()

      return {
        auto_brackets = {},
        completion = {
          -- autocomplete = false,
          -- completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
          completeopt = "menu,menuone,preview,popup,noinsert"
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-Space>'] = cmp.mapping.complete(),

          -- ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          -- ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
          ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1
            if cmp.visible() then
              cmp.select_next_item()
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') == nil then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
          { name = 'nvim_lsp_signature_help' },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          fields = { "abbr", "kind" },
          format = function(entry, item)
            icon = kind_icons[item.kind] or ""
            item.kind = " " .. icon ..  item.kind

            local widths = {
              abbr = (vim.g.cmp_widths and vim.g.cmp_widths.abbr) or 40,
              menu = (vim.g.cmp_widths and vim.g.cmp_widths.menu) or 30,
            }

            for key, width in pairs(widths) do
              if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
              end
            end

            return item
          end,
        },
        experimental = {
          -- ghost_text = {
          --   hl_group = "CmpGhostText",
          -- },
        },
        sorting = defaults.sorting,
      }
    end
  },
}
