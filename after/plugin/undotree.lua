require 'which-key'.register({
	["<leader>"] = {
		U = { "<cmd>UndotreeToggle<CR>", "Toggle undo tree" },
	},
}, { mode = "n" })
