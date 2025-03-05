Keymap = vim.keymap.set

return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    require "configs.lspconfig"

    -- Custom keybinds
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP Show help" })
    Keymap("n", "K", vim.lsp.buf.hover, { silent = true, noremap = true })
    Keymap("n", "gd", vim.lsp.buf.definition, { silent = true, noremap = true, desc = "LSP Go to definition" })
    Keymap("n", "gr", vim.lsp.buf.references, { silent = true, noremap = true, desc = "LSP Go to references" })
    Keymap("n", "gi", vim.lsp.buf.implementation, { silent = true, noremap = true, desc = "LSP Go to implementations" })
    -- For some reason, the default NvRenamer keybind doesn't get bound for all LSPs.
    --  I can't delete it either. Too bad!
    Keymap(
      "n",
      "<leader>ra",
      require "nvchad.lsp.renamer",
      { silent = true, noremap = true, desc = "LSP Rename symbol" }
    )
  end,
}
