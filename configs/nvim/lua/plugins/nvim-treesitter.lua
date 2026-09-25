vim.pack.add({ { src = 'https://github.com/nvim-treesitter/nvim-treesitter' } })
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'lua', 'css', 'json', 'toml', 'conf', 'jsonc', 'bash', 'fish', 'sh' },
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
