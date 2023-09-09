local wk = require("which-key")
local builtin = require("telescope.builtin")

wk.register({
  name = "Telescope",
  f = { builtin.find_files, "Find Files" },
  g = { builtin.git_files, "Git Files" },
  s = { builtin.live_grep, "Grep String" },
  d = { builtin.diagnostics, "Document Diagnostics" },
  b = { builtin.buffers, "Buffers" },
  o = { builtin.oldfiles, "Old Files" },
}, {
  prefix = "<leader>t",
})

return {
  "nvim-telescope/telescope.nvim",
  -- replace all Telescope keymaps with only one mapping
  keys = function()
    return {}
  end,
}
