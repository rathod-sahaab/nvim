local wk = require("which-key")

wk.register({
	["<leader>"] = {
		d = { "\"_d", "Delete to null clipboard" },
		y = { "\"+y", "Copy to clipboard" },
		e = { "<cmd>NvimTreeFocus<CR>", "Focus file explorer" },
	},
	g = {
		name = "Goto",
		b = { "<cmd>:BufferLinePick<CR>", "Pick buffer" },
		h = { "<C-w>h", "Goto split on left" },
		l = { "<C-w>l", "Goto split on right" },
		j = { "<C-w>j", "Goto split on bottom" },
		k = { "<C-w>k", "Goto split on top" },
	},
	['<C-n>'] = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
}, { mode = "n" })

wk.register({
	["<leader>"] = {
		d = { "\"_d", "Delete to null clipboard" },
		y = { "\"+y", "Copy to system clipboard" },
	},
	['<C-n>'] = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
}, { mode = "v" })

wk.register({
	["<leader>"] = {
		d = { "\"_d", "Delete to null clipboard" },
		y = { "\"+y", "Copy to system clipboard" },
	},
	['<C-n>'] = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
}, { mode = "i" })

wk.setup()
