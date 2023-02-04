require("bufferline").setup {
	options = {
		separator_style = 'slant',
		hover = {
			enabled = true,
			delay = 200,
			reveal = { 'close' }
		},
		diagnostics = 'nvim_lsp',
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " ✘ "
				    or (e == "warning" and " ▲ " or "  ")
				s = s .. n .. sym
			end
			return s
		end,
		numbers = 'ordinal',
		offsets = {
			{
				filetype = "NvimTree",
				text = "Explorer",
				highlight = "Directory",
				separator = '' -- use a "true" to enable the default, or set your own character
			}
		}
	},
}
