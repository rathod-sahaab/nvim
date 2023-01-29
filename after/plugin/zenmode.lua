require("zen-mode").setup {
	window = {
		options = {
			number = true,
			relativenumber = true,
		},
	},
}

vim.keymap.set("n", "<leader>zz", function()
	require("zen-mode").toggle({
		window = {
			width = .9
		}
	})
	vim.wo.wrap = false
end)
