vim.g.mapleader = " "

local wk = require("which-key")

wk.register({
	['<Esc>'] = { "<cmd>noh<CR><Esc>", "Clear Highlights" },
	["<leader>"] = {
		d = { "\"_d", "Delete to null clipboard" },
		y = { "\"+y", "Copy to clipboard" },
		Y = { "\"+Y", "Copy line to clipboard" },
		e = { "<cmd>NvimTreeFocus<CR>", "Focus file explorer" },
		k = { "<cmd>lnext<CR>zz", "Goto previous error" },
		j = { "<cmd>lprev<CR>zz", "Goto next error" },
		s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace word under cursor" },
		u = {
			name = "UI",
			b = {
				name = 'Buffers',
				d = { "<cmd>bd<CR>", "Sort by directory" },
			},
			t = {
				name = "Toggle",
				b = { function()
					if vim.opt.background:get() == "dark" then
						vim.cmd("set background=light")
					else
						vim.cmd("set background=dark")
					end
				end, "Dark mode" },
			}
		}
	},
	g = {
		name = "Goto",
		t = { "<cmd>BufferLinePick<CR>", "Pick Tab" },
		B = { "<cmd>bprev<CR>", "Previous buffer" },
		b = { "<cmd>bnext<CR>", "Next buffer" },
		h = { "<C-w>h", "Goto split on left" },
		l = { "<C-w>l", "Goto split on right" },
		j = { "<C-w>j", "Goto split on bottom" },
		k = { "<C-w>k", "Goto split on top" },
	},
	['<C-n>'] = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
	['<C-s>'] = { "<cmd>w<CR>", "Save file" },
	J = { "mzJ`z", "Join lines below" },

	['<C-d>'] = { "<C-d>zz", "Scroll down" },
	['<C-u>'] = { "<C-u>zz", "Scroll up" },

	n = { "nzzzv", "Next search result" },
	N = { "Nzzzv", "Previous search result" },

	["<C-`>"] = { "<cmd>tabnew term://fish<CR>", "Open terminal" },
	["<A-h>"] = { "<cmd>bo split term://fish<CR>", "Open terminal in horizontal split" },
	["<A-v>"] = { "<cmd>bo vsplit term://fish<CR>", "Open terminal in horizontal vertical split" },
	["<A-t>"] = { "<cmd>tabnew term://fish<CR>", "Open terminal in new tab" },
}, { mode = "n" })

wk.register({
	["<leader>"] = {
		d = { "\"_d", "Delete to null clipboard" },
		y = { "\"+y", "Copy to system clipboard" },
	},
	['<C-n>'] = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
	['<C-s>'] = { "<cmd>w<CR>", "Save file" },
	J = { ":m '>+1<CR>gv=gv", "Move selection down" },
	K = { ":m '<-2<CR>gv=gv", "Move selection up" },
}, { mode = "v" })

wk.register({
	['<C-n>'] = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
	['<C-s>'] = { "<cmd>w<CR>", "Save file" },
	['jk'] = { "<Esc>", "Exit insert mode" },
}, { mode = "i" })

wk.register({
	['<C-n>'] = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
	g = {
		name = "Goto",
		b = { "<cmd>:BufferLinePick<CR>", "Pick buffer" },
		h = { "<C-w>h", "Goto split on left" },
		l = { "<C-w>l", "Goto split on right" },
		j = { "<C-w>j", "Goto split on bottom" },
		k = { "<C-w>k", "Goto split on top" },
	},
}, { mode = "t" })

wk.register({
	['<leader>p'] = { "\"_dP", "Paste in place without overwriting register" },
	['<C-n>'] = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
}, { mode = "x" })

wk.setup()
