local wk = require('which-key')

require('gitsigns').setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		wk.register({
			name = "Git",
			h = {
				name = "Hunk",
				n = { gs.next_hunk, "Next hunk" },
				p = { gs.prev_hunk, "Previous hunk" },
				s = { gs.stage_hunk, "Stage hunk" },
				us = { gs.undo_stage_hunk, "Undo stage hunk" },
				r = { gs.reset_hunk, "Reset hunk" },
				pr = { gs.preview_hunk, "Preview hunk" },
				pri = { function() gs.preview_hunk { inline = true } end, "Preview hunk inline" },
			},
			t = {
				name = "Toggle",
				b = { gs.toggle_current_line_blame, "Blame Line" },
				d = { gs.toggle_deleted, "Deleted" },
			},
			b = {
				name = "Buffer",
				d = { gs.diffthis, "Diff this" },
				D = { function() gs.diffthis('~') end, "Diff with split view" },
				s = { gs.stage_buffer, "Stage buffer" },
				us = { gs.undo_stage_buffer, "Undo stage buffer" },
				r = { gs.reset_buffer, "Reset buffer" },
			}
		}, { mode = 'n', buffer = bufnr, prefix = "<leader>g" })
	end
})
