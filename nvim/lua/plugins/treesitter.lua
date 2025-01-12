return {
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
      "bash",
      "python",
    },
    -- For vim-matchup. See https://github.com/andymass/vim-matchup#tree-sitter-integration
    matchup = {
      enable = true,
      -- Disable annoying "if" text at the end of if-blocks
      disable_virtual_text = true,
    },
  },
}
