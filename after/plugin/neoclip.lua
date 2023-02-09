require('neoclip').setup()

local wk = require("which-key")

wk.register({
	['<leader>t'] = {
		c = { require('telescope').extensions.neoclip.default, "Clipboard" }
	}
})
