require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<C-j>", "i<CR><ESC>", { noremap = true })
vim.api.nvim_create_user_command("BufOnly", "%bd|e#", { desc = "Buffer Delete all buffers except this one" })
vim.api.nvim_create_user_command("BufNone", "%bd", { desc = "Buffer Delete all buffers" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
