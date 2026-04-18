vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader> ", vim.cmd.Lazy)
vim.keymap.set("n", "<leader>\t", "<C-w>w", { noremap = true, silent = true })
