local lsp = require('lsp-zero')
local navic = require('nvim-navic')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'sumneko_lua',
	'rust_analyzer'
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
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
	mappings = cmp_mappings,
})

lsp.set_preferences({})

local custom_on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	navic.attach(client, bufnr)

	local which_key = require("which-key")

	which_key.register({
		name = "lsp",
		t = {
			name = "toggle",
			wd = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace Diagnostics" },
			r = { "<cmd>TroubleToggle lsp_refrences<CR>", "Refrences" },
			d = { '<cmd>TroubleToggle document_diagnostics<CR>', "Show diagnostics" },
		},
		c = { function() vim.lsp.buf.code_action() end, "Run code action" },
		d = {
			name = "diagnostics",
			o = { function() vim.diagnostic.open_float({ border = "single" }) end, "Open floating window" },
			N = { function() vim.diagnostic.goto_prev() end, 'Goto previous diagnosis' },
			n = { function() vim.diagnostic.goto_next() end, 'Goto next diagnosis' },
		},
		f = { function() vim.lsp.buf.format({
				filter = function()
					return client.name ~= "tsserver"
				end,
				timeout = 30000,
				bufnr = bufnr,
			})
		end, "Format code" },
		i = { function() vim.lsp.buf.incoming_calls() end, "Show incoming calls" },
		o = { function() vim.lsp.buf.outgoing_calls() end, "Show outgoing calls" },
		r = { function() vim.lsp.buf.rename() end, "Rename symbol under cursor" },
		T = { function() vim.lsp.buf.type_definition() end, "Go to type definition" },
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
	which_key.register({
		["<C-h>"] = { function()
			vim.lsp.buf.signature_help({ border = 'single' })
		end, "Signature Help" },
	}, {
		mode = "i",
		buffer = bufnr,
	})
end

lsp.on_attach(custom_on_attach)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

require 'lspconfig'.sumneko_lua.setup {
	on_attach = custom_on_attach,
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
