local lsp = require('lsp-zero')
local navic = require('nvim-navic')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'sumneko_lua',
	'rust_analyzer'
})

local cmp = require('cmp')
local cmp_select = { behaviour = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	sources = {
		-- This one provides the data from copilot.
		{ name = 'copilot' },

		--- These are the default sources for lsp-zero
		{ name = 'path' },
		{ name = 'nvim_lsp', keyword_length = 3 },
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'luasnip', keyword_length = 2 },
	},
	mapping = cmp_mappings
})

lsp.set_preferences({
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	navic.attach(client, bufnr)

	local which_key = require("which-key")

	which_key.register({
		name = "lsp",
		D = { function() vim.lsp.diagnostic.set_loclist() end, "Show diagnostics for current buffer" },
		R = { function() vim.lsp.buf.references() end, "Show references" },
		c = { function() vim.lsp.buf.code_action() end, "Run code action" },
		d = {
			name = "diagnostics",
			l = { function() vim.diagnostic.show_line_diagnostics({ border = "single" }) end, "Show line diagnostics" },
			o = { function() vim.diagnostic.open_float({ border = "single" }) end, "Open floating window" },
			p = {function() vim.diagnostic.goto_prev() end, 'Goto previous diagnosis'},
			n = {function() vim.diagnostic.goto_next() end, 'Goto next diagnosis'},
		} ,
		f = { function() vim.lsp.buf.formatting() end, "Format code" },
		i = { function() vim.lsp.buf.incoming_calls() end, "Show incoming calls" },
		o = { function() vim.lsp.buf.outgoing_calls() end, "Show outgoing calls" },
		r = { function() vim.lsp.buf.rename() end, "Rename symbol under cursor" },
		s = { function() vim.lsp.buf.document_symbol() end, "Search for symbol in document" },
		t = { function() vim.lsp.buf.type_definition() end, "Go to type definition" },
		w = {
			name = "workspace",
			D = {
				function() vim.lsp.diagnostic.set_loclist({ workspace = true }) end,
				"Show diagnostics for current workspace",
			},
			a = { function() vim.lsp.buf.add_workspace_folder() end, "Add workspace folder" },
			l = { function() print(vim.lsp.buf.list_workspace_folders()) end, "List workspace folders" },
			r = { function() vim.lsp.buf.remove_workspace_folder() end, "Remove workspace folder" },
			s = { function() vim.lsp.buf.workspace_symbol() end, "Search for symbol in workspace" },
		},
	}, {
		prefix = "<leader>l",
		buffer = bufnr,
	})
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({
		filter = function(client) return client.name ~= "tsserver" end,
		timeout_ms = 30000
	})
end)

require 'lspconfig'.sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}
