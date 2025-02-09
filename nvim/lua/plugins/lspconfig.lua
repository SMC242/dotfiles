Keymap = vim.keymap.set

return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    require "configs.lspconfig"

    -- Custom keybinds
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP Show help" })
    Keymap("n", "K", vim.lsp.buf.hover, { silent = true, noremap = true })
    Keymap("n", "<leader>gd", vim.lsp.buf.definition, { silent = true, desc = "LSP Go to definition" })
  end,
}
