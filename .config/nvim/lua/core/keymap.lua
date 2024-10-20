vim.g.mapleader = " "

-- Escape to normal mode
vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("t", "kj", "<C-\\><C-n>")

-- Don't write to clipboard
vim.keymap.set("n", "x", '"_x')

-- Inclement and decrement
vim.keymap.set("n", "<C-a>", "<C-a><C-a>")
vim.keymap.set("n", "<C-x>", "<C-x><C-x>")

-- Write and quit
vim.keymap.set("n", "<Leader>w", "<CMD>w<CR>")
vim.keymap.set("n", "<Leader>q", "<CMD>q<CR>")
vim.keymap.set("n", "<C-q>", "<CMD>qa<CR>")
vim.keymap.set("i", "<C-q>", "<CMD>qa<CR>")
vim.keymap.set("t", "<C-q>", "<CMD>qa<CR>")

-- Window operation
vim.keymap.set("n", "s", "<C-w>")

-- Tab operation
vim.keymap.set("n", "<Leader>tl", "gt")
vim.keymap.set("n", "<Leader>th", "gT")
vim.keymap.set("n", "<Leader>tn", "<CMD>tabnew<CR>")

-- Open file explorer
vim.keymap.set("n", "<Leader>e", "<CMD>e .<CR>")

-- Nop unused keymaps
vim.keymap.set("n", "f", "<Nop>")
