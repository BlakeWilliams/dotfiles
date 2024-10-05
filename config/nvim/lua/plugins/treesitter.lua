return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    version = false,
    event = { "BufEnter", "VeryLazy" },
    lazy = vim.fn.argc(-1) == 0,

    -- unsure why this is necessary, but lazyvim does it
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,

    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

    -- opts_extend = { "ensure_installed" },

    opts = {
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = false },
      -- Ensure general languages are installed. Specific languages with LSP
      -- and other config will be in the plugins/lang dir
      ensure_installed = {
        "html",
        "lua",
        "dockerfile",
        "json",
        "editorconfig",
        "cmake",
        "css",
        "diff",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "git_config",
        "gitignore",
        "graphql",
        "kdl",
        "mermaid",
        "markdown",
        "markdown_inline",
        "nginx",
        "proto",
        "regex",
        "scss",
        "sql",
        "tmux",
        "toml",
        "vim",
        "xml",
        "yaml",
      },
    },

    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        opts.ensure_installed = opts.ensure_installed
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
