local header = {
  type = "text",
  val = {
    " ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
    " ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
    "▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
    "▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
    "▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
    "░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
    "░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
    "   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
    "         ░    ░  ░    ░ ░        ░   ░         ░   ",
    "                                ░                  ",
  },
  opts = { position = "center", hl = "Type" },
}

if os.getenv("CODESPACES") then
  header.val = {
    "                                                                                        ",
    "  ▄████▄   ▒█████  ▓█████▄ ▓█████   ██████  ██▓███   ▄▄▄       ▄████▄  ▓█████   ██████  ",
    " ▒██▀ ▀█  ▒██▒  ██▒▒██▀ ██▌▓█   ▀ ▒██    ▒ ▓██░  ██▒▒████▄    ▒██▀ ▀█  ▓█   ▀ ▒██    ▒  ",
    " ▒▓█    ▄ ▒██░  ██▒░██   █▌▒███   ░ ▓██▄   ▓██░ ██▓▒▒██  ▀█▄  ▒▓█    ▄ ▒███   ░ ▓██▄    ",
    " ▒▓▓▄ ▄██▒▒██   ██░░▓█▄   ▌▒▓█  ▄   ▒   ██▒▒██▄█▓▒ ▒░██▄▄▄▄██ ▒▓▓▄ ▄██▒▒▓█  ▄   ▒   ██▒ ",
    " ▒ ▓███▀ ░░ ████▓▒░░▒████▓ ░▒████▒▒██████▒▒▒██▒ ░  ░ ▓█   ▓██▒▒ ▓███▀ ░░▒████▒▒██████▒▒ ",
    " ░ ░▒ ▒  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░▒ ▒▓▒ ▒ ░▒▓▒░ ░  ░ ▒▒   ▓▒█░░ ░▒ ▒  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░ ",
    "   ░  ▒     ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░░ ░▒  ░ ░░▒ ░       ▒   ▒▒ ░  ░  ▒    ░ ░  ░░ ░▒  ░ ░ ",
    " ░        ░ ░ ░ ▒   ░ ░  ░    ░   ░  ░  ░  ░░         ░   ▒   ░           ░   ░  ░  ░   ",
    " ░ ░          ░ ░     ░       ░  ░      ░                 ░  ░░ ░         ░  ░      ░   ",
    " ░                  ░                                         ░                         ",
    "                                                                                        ",
    "                You can :q any time you like, but you can never leave...                ",
  }
end


local function button(btn, txt, keybind)
  local sc = btn:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    shortcut = sc,
    cursor = 0,
    width = 50,
    align_shortcut = "right",
    hl_shortcut = "Keyword",
  }

  if keybind then
    opts.keymap = { "n", sc, keybind, { noremap = true, silent = true, nowait = true } }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(sc .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "t", false)
  end

  return {
    type = "button",
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    button("e", "- Explore", "<Plug>VinegarUp"),
    button("u", "- Update plugins", ":Lazy update<cr>"),
    button("l", "- Lazy manager", ":Lazy<cr>"),
    button("q", "- Quit", ":q!<cr>"),
  },
  opts = {
    spacing = 0,
  },
}

local footer = {
  type = "text",
  val = "v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
  opts = { position = "center", hl = "number" }
}


return {
  {
    'goolord/alpha-nvim',
    lazy = vim.fn.argc(-1) ~= 0,
    priority = 1000,
    config = {
      layout = {
        { type = "padding", val = 2 },
        header,
        { type = "padding", val = 2 },
        buttons,
        { type = "padding", val = 1 },
        footer,
      },
      opts = {
        margin = 5,
      },
    }
  }
}
