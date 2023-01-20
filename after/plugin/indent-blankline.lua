vim.opt.list = true
vim.opt.listchars:append "space:⋅"

require("indent_blankline").setup({
	char = "▏",
	context_char = "▏",
	show_current_context = true,
	show_current_context_start = true,
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	use_treesitter = true,
})
