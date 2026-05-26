vim.pack.add({
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' }, -- optional
	{ src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require('nvim-tree').setup()
