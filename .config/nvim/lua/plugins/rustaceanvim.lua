return {
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
}
