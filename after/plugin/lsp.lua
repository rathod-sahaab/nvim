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
	['<C-n>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})


-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	navic.attach(client, bufnr)

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, opts)
	-- goto diagnostic
	vim.keymap.set("n", "<leader>ldp", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ldn", function() vim.diagnostic.goto_next() end, opts)
	-- code actions
	vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
	-- lsp diagnostic expand
	vim.keymap.set("n", "<leader>lde", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<leader>lgi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "<leader>lgr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
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
