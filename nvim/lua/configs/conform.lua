local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "isort", "black" },
    javascript = { "prettier" },
    typescript = { "prettierd", "eslint_d" },
    yaml = { "yamllint" },
    go = { "goimports", "gofmt" },
    c = { "clang-format" },
    cpp = { "clangformat" },
    haskell = { "ormolu" },
    markdown = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
