-- local navic = require("nvim-navic")

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			'NvimTree'
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			-- tabline = 1000,
			-- winbar = 1000,
		}
	},
	sections = {
		lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 3) end } },
		lualine_b = { 'branch' },
		lualine_c = { 'diff', 'diagnostics' },
		lualine_x = { 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	inactive_winbar = {},
	extensions = {}
}
