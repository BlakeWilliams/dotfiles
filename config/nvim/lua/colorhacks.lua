-- color hacks, for consistency,

vim.api.nvim_create_autocmd("colorscheme", {
  callback = function()
    vim.cmd("highlight SignColumn guibg=bg")
  end,
})

local function HL(name)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  return ok and hl or {}
end

local function standardize_float_colors()
  local normal = HL("Normal")
  local linenr = HL("LineNr")

  if not normal.bg or not linenr.fg then return end
  local bg = normal.bg
  local border = linenr.fg

  -- core floats
  vim.api.nvim_set_hl(0, "NormalFloat",       { bg = bg })
  vim.api.nvim_set_hl(0, "FloatBorder",       { fg = border, bg = bg })
  vim.api.nvim_set_hl(0, "FloatTitle",        { fg = border, bg = bg })

  -- LSP floats
  vim.api.nvim_set_hl(0, "LspFloatWinNormal", { bg = bg })
  vim.api.nvim_set_hl(0, "LspFloatWinBorder", { fg = border, bg = bg })
  vim.api.nvim_set_hl(0, "LspInfoBorder",     { fg = border, bg = bg })

  -- Telescope floats
  vim.api.nvim_set_hl(0, "TelescopeNormal",        { bg = bg })
  vim.api.nvim_set_hl(0, "TelescopeBorder",        { fg = border, bg = bg })
  vim.api.nvim_set_hl(0, "TelescopePromptNormal",  { bg = bg })

  vim.api.nvim_set_hl(0, "TelescopePromptBorder",  { fg = border, bg = bg })
  vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = bg })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = border, bg = bg })
  vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = bg })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = border, bg = bg })

  -- completion menu
  vim.api.nvim_set_hl(0, "Pmenu",       { bg = bg })
  vim.api.nvim_set_hl(0, "PmenuBorder", { fg = border, bg = bg })
end

standardize_float_colors()
vim.api.nvim_create_autocmd("ColorScheme", { callback = standardize_float_colors })

for _, fn in ipairs({ "hover", "signature_help" }) do
  vim.lsp.handlers["textDocument/" .. fn] =
    vim.lsp.with(vim.lsp.handlers[fn], { border = "rounded" })
end

local function standardize_numbers()
  local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
  if not normal.bg then return end

  local bg = normal.bg
  local sign_groups = {
    "SignColumn", "LineNr", "CursorLineNr",
    "DiagnosticSignError", "DiagnosticSignWarn",
    "DiagnosticSignHint", "DiagnosticSignInfo",
    "GitSignsAdd", "GitSignsChange", "GitSignsDelete",
  }

  for _, group in ipairs(sign_groups) do
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    hl.bg = bg
    vim.api.nvim_set_hl(0, group, hl)
  end
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = standardize_numbers, })
standardize_numbers()
