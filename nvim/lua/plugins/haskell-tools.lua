-- https://github.com/mrcjkb/haskell-tools.nvim?tab=readme-ov-file#zap-quick-setup
return {
  "mrcjkb/haskell-tools.nvim",
  version = "^4",
  lazy = false,
  ft = "haskell",
  config = function()
    local ht = require "haskell-tools"
    local bufnr = vim.api.nvim_get_current_buf()

    Keymap(
      "n",
      "<leader>cl",
      vim.lsp.codelens.run,
      { silent = true, buffer = bufnr, desc = "LSP Haskell show code actions" }
    )
    Keymap(
      "n",
      "<leader>ca",
      "<Plug>HaskellHoverAction",
      { silent = false, buffer = bufnr, desc = "LSP Haskell code action" }
    )
    Keymap(
      "n",
      "<leader>ho",
      ht.hoogle.hoogle_signature,
      { silent = true, buffer = bufnr, desc = "LSP Haskell open Hoogle" }
    )
    Keymap("n", "<leader>re", ht.repl.toggle, { silent = true, buffer = bufnr, desc = "LSP Haskell toggle REPL" })
    Keymap("n", "<leader>rq", ht.repl.quit, { silent = true, buffer = bufnr, desc = "LSP Haskell close REPL" })
  end,
}
