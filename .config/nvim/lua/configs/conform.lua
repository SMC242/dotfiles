MASON_BIN_PATH = vim.fn.stdpath "data" .. "/mason/bin"

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "ruff" },
    javascript = { "prettier" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    astro = { "prettierd" },
    yaml = { "yamllint" },
    go = { "goimports", "gofmt" },
    c = { "clang-format" },
    cpp = { "clangformat" },
    haskell = { "ormolu" },
    markdown = { "prettier" },
    bash = { "shellcheck" },
  },

  formatters = {
    ruff = {
      command = MASON_BIN_PATH .. "/ruff",
      args = { "format", "$FILENAME" },
      stdin = false,
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    -- From https://github.com/LazyVim/LazyVim/discussions/1728#discussioncomment-7285575
    timeout_ms = 10000,
    lsp_fallback = true,
  },
}

-- eslint_d is slow so using an autocmd to automatically apply ESlint's suggestions
-- See https://github.com/stevearc/conform.nvim/issues/364#issuecomment-2308959873
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("EslintFixAll", { clear = true }),
  pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
  command = "silent! EslintFixAll",
})

require("conform").setup(options)
