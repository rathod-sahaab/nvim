local wk = require('which-key')
local builtin = require('telescope.builtin')
local telescope = require('telescope')

wk.register({
	name = 'Telescope',
	f = { builtin.find_files, 'Find Files' },
	g = { builtin.git_files, 'Git Files' },
	s = { builtin.live_grep, 'Grep String' },
	d = { builtin.diagnostics, 'Document Diagnostics' },
	b = { builtin.buffers, 'Buffers' },
	o = { builtin.oldfiles, 'Old Files' },
}, {
	prefix = '<leader>t',
})

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		dynamic_preview_title = true,
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.6,
				results_width = 0.4,
			},
			vertical = {
				mirror = false,
			},
			width = 0.70,
			height = 0.80,
			preview_cutoff = 120,
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "node_modules", "dist" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			n = { ["q"] = require("telescope.actions").close },
		},
	},
	extensions_list = { "themes", "terms", },
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
})
