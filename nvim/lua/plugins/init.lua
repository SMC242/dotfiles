-- Hybrid line numbers by default
vim.wo.number = true
vim.wo.relativenumber = true

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
    lazy = false,
    keys = {
      {
        "<leader>ca",
        function()
          vim.cmd.RustLsp "codeAction"
        end,
        silent = true,
        desc = "LSP Rust code action",
      },
      {
        "K",
        function()
          vim.cmd.RustLsp { "hover", "actions" }
        end,
        silent = true,
        desc = "LSP Rust hover",
      },
      {
        "<leader>ex",
        function()
          vim.cmd.RustLsp { "explainError", "current" }
        end,
        silent = true,
        mode = "n",
        desc = "LSP Rust explain error",
      },
      {
        "<leader>er",
        function()
          vim.cmd.RustLsp { "renderDiagnostic", "current" }
        end,
        silent = true,
        mode = "n",
        desc = "LSP Rust render error",
      },
    },
  },
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^4",
    lazy = false,
    ft = "haskell",
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
