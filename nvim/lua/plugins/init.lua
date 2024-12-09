-- Hybrid line numbers by default
vim.wo.number = true
vim.wo.relativenumber = true

Keymap = vim.keymap.set

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"

      -- Custom keybinds
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP Show help" })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "rust",
        "yaml",
        "c_sharp",
        "javascript",
        "typescript",
        "tsx",
        "go",
        "c",
        "cpp",
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    config = function()
      require("render-markdown").setup {}
    end,
    ft = "markdown",
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = true,
    ft = "rust",
    config = function()
      Keymap("n", "<leader>ca", function()
        vim.cmd.RustLsp "codeAction"
      end, { silent = true, desc = "LSP Rust code action" })

      Keymap("n", "K", function()
        vim.cmd.RustLsp { "hover", "actions" }
      end, {
        silent = true,
        desc = "LSP Rust code action",
      })

      Keymap("n", "<leader>ex", function()
        vim.cmd.RustLsp { "explainError", "current" }
      end, { desc = "LSP Rust explain error" })

      Keymap("n", "<leader>er", function()
        vim.cmd.RustLsp { "renderDiagnostic", "current" }
      end, { silent = true, desc = "LSP Rust render error" })
    end,
  },
  -- https://github.com/mrcjkb/haskell-tools.nvim?tab=readme-ov-file#zap-quick-setup
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^4",
    lazy = false,
    ft = "haskell",
    config = function()
      local ht = require "haskell-tools"
      local opts = { noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() }

      Keymap("n", "K", vim.lsp.codelens.run, opts)
      Keymap("n", "<leader>ho", ht.hoogle.hoogle_signature, opts)
      Keymap("n", "<leader>re", ht.repl.toggle, opts)
      Keymap("n", "<leader>rq", ht.repl.quit, opts)
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    opts = {},
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
    end,
    event = { "BufReadPre", "BufNewFile" },
  },
}
