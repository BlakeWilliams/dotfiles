GlobalConfig = {}
GlobalConfig.icons = {
  Error = "✕ ",
  Warn = "! ",
  Hint = "★ ",
  Info = "i ",
}


require('lazy-setup')

-- Unmap useless keys
vim.api.nvim_set_keymap('n', 'Q', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<Nop>', { noremap = true, silent = true })

-- global configuration
vim.g.html_indent_tags = 'li|p'
vim.g.vim_json_syntax_conceal = 0 -- todo extract into json or lang file

-- Vinegar hide dotfiles
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro nonumber'
vim.g.netrw_list_hide = '\\(^\\|\\s\\s\\)\\zs\\.\\S\\+'
vim.g.netrw_retmap = 1
vim.g.netrw_fastbrowse = 0
vim.g.netrw_retmap = 1     -- Disable left click open
vim.g.netrw_dirhistmax = 0 -- Disable netrw history

-- TODO extract into plugin file
vim.cmd [[
  let g:grepper = {}
  let g:grepper.tools = ['rg', 'git']
]]

-- General config
vim.opt.autoindent = true -- Copy indent from previous line
vim.opt.backupcopy = 'yes' -- Keeps original creator code
vim.opt.backspace = { 'indent', 'eol', 'start' } -- Adds intuitive backspacing
vim.opt.fillchars:append('vert:│') -- Use tall pipe in split separators
vim.opt.cursorline = true -- Highlight current line
vim.opt.guicursor = 'i:ver25-iCursor' -- Use | cursor when in insert mode
vim.opt.history = 100 -- Keep 100 lines of command line history
vim.opt.hlsearch = true -- Highlights search
vim.opt.ignorecase = true -- Ignore case in searches
vim.opt.incsearch = true -- Searches for text as entered

-- Statusline settings based on Neovim version
if vim.fn.has('nvim-0.7.0') == 1 then
  vim.opt.laststatus = 3 -- Always show one statusline
else
  vim.opt.laststatus = 2 -- Always show statusline
end

vim.opt.lazyredraw = false                      -- Boosts performance at times, but disabled for notify
vim.opt.list = true                             -- Don't show listchars
vim.opt.listchars = { tab = '»·', trail = '·' } -- Show trailing spaces as dots
vim.opt.matchtime = 0                           -- Fix Neovim match lag
vim.opt.backup = false                          -- No Backup files
vim.opt.errorbells = false                      -- Obvious
vim.opt.hidden = true                           -- Hide unsaved buffers
vim.opt.number = true                           -- Show regular numbers
vim.opt.foldenable = false                      -- Disable folds
vim.opt.showcmd = false                         -- Don't show command in the last line of the screen
vim.opt.swapfile = false                        -- No swap
vim.opt.autoread = false                        -- Don't automatically read files when they are changed
vim.opt.wrap = false                            -- Don't wrap lines
vim.opt.relativenumber = true                   -- Show relative line numbers
vim.opt.ruler = true                            -- Show the ruler
vim.opt.scrolloff = 10                          -- Always keep current line in center
vim.opt.completeopt:append('menuone')           -- Always show menu
vim.opt.completeopt:append('noselect')          -- Don't select only option
vim.opt.shortmess:append('fmnrWIcF')            -- Customize what vim yells at you
vim.opt.showmatch = true                        -- Highlight matching paren/brace/bracket
vim.opt.smartcase = true                        -- Enable case-sensitive search only when uppercase characters present
vim.opt.smartindent = true                      -- Auto insert extra indent level in certain cases
vim.opt.smarttab = true                         -- Prevents tab/space issues
vim.opt.synmaxcol = 180                         -- Prevents segfaults and slow rendering
vim.opt.splitbelow = true                       -- Open horizontal splits below rather than above
vim.opt.splitright = true                       -- Open vertical splits to the right rather than left
vim.opt.tags:prepend('.git/tags')               -- Where to find tags
vim.opt.termguicolors = true                    -- 256 colors!
vim.opt.undolevels = 500                        -- More undo
vim.opt.wildignorecase = true                   -- Case insensitive completions
vim.opt.wildmenu = true                         -- Better wildmenu

vim.opt.signcolumn = 'yes:1'                    -- Show sign column
vim.opt.signcolumn = 'auto:1-2'                 -- Adaptive signcolumn

-- Formatting settings
vim.opt.expandtab = true -- Make spaces not tabs
vim.opt.shiftwidth = 2   -- 2 spaces when indented

-- Filetype specific indent and plugins
vim.cmd('filetype indent on') -- Filetype specific indent
vim.cmd('filetype plugin on') -- Filetype specific plugins

-- Mouse support
if vim.fn.has('mouse') == 1 then
  vim.opt.mouse = 'a' -- Enable mouse
end

-- Use undo file for awesome undo
if vim.fn.exists("+undofile") == 1 then
  if vim.fn.isdirectory(vim.fn.expand("$HOME") .. '/.config/nvim/undo') == 0 then
    vim.cmd('silent !mkdir -p ~/.config/nvim/undo > /dev/null 2>&1')
  end
  vim.opt.undofile = true                                           -- Enable undo file
  vim.opt.undodir = vim.fn.expand("$HOME") .. '/.config/nvim/undo/' -- Set undo directory
end

-- Better diffing
if vim.opt.diff:get() and vim.fn.has("patch-8.1.0360") == 1 then
  vim.opt.diffopt:append({ 'internal', 'algorithm:patience', 'vertical' }) -- Better diff options
end

-- Forward clipboard in a codespace
if os.getenv("CODESPACES") ~= nil and os.getenv("CODESPACES") ~= "" then
  vim.g.clipboard = {
    name = "rdm",
    copy = { ["+"] = { "rdm", "copy" }, ["*"] = { "rdm", "copy" } },
    paste = { ["+"] = { "rdm", "paste" }, ["*"] = { "rdm", "paste" } }
  }
end

vim.cmd('source $HOME/.config/nvim/colors.vim')
vim.cmd('source $HOME/.config/nvim/autocommands.vim')
