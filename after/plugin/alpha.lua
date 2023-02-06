local alpha = require("alpha")
---@diagnostic disable-next-line: unused-local
local term = require('alpha.term')
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮]],
	[[│││├┤ │ │╰┐┌╯││││]],
	[[╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴]]
}

local width = 50
local height = 12
dashboard.section.terminal.command = "cat | " .. os.getenv("HOME") .. "/.config/nvim/art/logo.sh"
dashboard.section.terminal.width = width
dashboard.section.terminal.height = height
dashboard.section.terminal.opts.redraw = true

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find a file", "<cmd>Telescope find_files<CR>"),
	dashboard.button("p", "  Find a project", "<cmd>Telescope projects<CR>"),
	dashboard.button("r", "  Recently used files", "<cmd>Telescope oldfiles<CR>"),
	dashboard.button("c", "  Configuration", "<cmd>e $MYVIMRC<CR>"),
}
local function footer()
	-- Number of plugins
	-- local total_plugins = #vim.tbl_keys(vim.g.plugs)
	local datetime = os.date "%d-%m-%Y %H:%M:%S"
	local plugins_text = "   v"
	    .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch .. "  "
	    -- "   "
	    -- .. total_plugins
	    -- .. " plugins"
	    .. datetime

	-- Quote
	local fortune = require("alpha.fortune")
	local quote = table.concat(fortune(), "\n")

	return plugins_text .. "\n" .. quote
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
-- dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

dashboard.config.layout = {
	-- dashboard.section.terminal,
	{ type = "padding", val = 3 },
	dashboard.section.header,
	{ type = "padding", val = 2 },
	dashboard.section.buttons,
	{ type = "padding", val = 1 },
	dashboard.section.footer,
}
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Disable the statusline, tabline and cmdline while the alpha dashboard is open
autocmd('User', {
	pattern = 'AlphaReady',
	desc = 'disable status, tabline and cmdline for alpha',
	callback = function()
		vim.go.laststatus = 0
		vim.opt.showtabline = 0
		vim.opt.cmdheight = 0
	end,
})
autocmd('BufUnload', {
	buffer = 0,
	desc = 'enable status, tabline and cmdline after alpha',
	callback = function()
		vim.go.laststatus = 2
		vim.opt.showtabline = 2
		vim.opt.cmdheight = 1
	end,
})

alpha.setup(dashboard.opts)
