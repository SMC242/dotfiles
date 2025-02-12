Keymap = vim.keymap.set

return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    require "configs.lspconfig"

    -- Custom keybinds
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP Show help" })
    Keymap("n", "K", vim.lsp.buf.hover, { silent = true, noremap = true })
    Keymap("n", "<leader>gd", vim.lsp.buf.definition, { silent = true, noremap = true, desc = "LSP Go to definition" })
    Keymap("n", "gr", vim.lsp.buf.references, { silent = true, noremap = true, desc = "LSP Go to references" })
    Keymap("n", "gi", vim.lsp.buf.implementation, { silent = true, noremap = true, desc = "LSP Go to implementations" })
  end,
}
