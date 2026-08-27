-- Hybrid line numbers by default
vim.wo.number = true
vim.wo.relativenumber = true

Keymap = vim.keymap.set

-- I only want inlay hints for Rust, which is not configured with lspconfig
-- require("lsp-endhints").disable()
vim.lsp.inlay_hint.enable(false)

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {},
  },
  { import = "nvchad.blink.lazyspec" },
}
