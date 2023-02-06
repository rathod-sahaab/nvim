require("zen-mode").setup {
	window = {
		options = {
			number = true,
			relativenumber = true,
		},
	},
}

require('which-key').register({
	['<leader>zz'] = { function()
		require("zen-mode").toggle({
			window = {
				width = .6
			}
		})
		vim.wo.wrap = false
	end, 'Toggle Zen mode' },
})
