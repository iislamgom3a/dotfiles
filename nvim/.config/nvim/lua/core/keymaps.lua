vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<Esc>", ":noh<CR>", opts) -- disable search highlight using esc
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts) -- Toggle line wrapping
