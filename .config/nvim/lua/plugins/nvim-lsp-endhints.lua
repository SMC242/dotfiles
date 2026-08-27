-- I added this because rustaceanvim removed inlay hint (inline diagnostics) support
-- at the recommendation of its docs
-- See https://github.com/mrcjkb/rustaceanvim#can-i-display-inlay-hints-to-the-end-of-the-line
return {
  "chrisgrieser/nvim-lsp-endhints",
  event = "LspAttach",
  -- enabled = false,
  opts = {
    autoEnableHints = false,
  }, -- required, even if empty
}
