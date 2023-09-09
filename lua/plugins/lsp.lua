local which_key = require("which-key")

which_key.register({

  name = "lsp",
  t = {
    name = "toggle",
    wd = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace Diagnostics" },
    D = { "<cmd>TroubleToggle document_diagnostics<CR>", "Show diagnostics" },
    r = { "<cmd>TroubleToggle lsp_references<CR>", "References" },
    d = { "<cmd>TroubleToggle lsp_definitions<CR>", "Definition" },
    i = { "<cmd>TroubleToggle lsp_implementations<CR>", "Implementations" },
    t = { "<cmd>TroubleToggle lsp_type_definitions<CR>", "Type Definition" },
  },
  c = {
    function()
      vim.lsp.buf.code_action()
    end,
    "Run code action",
  },
  d = {
    name = "diagnostics",
    o = {
      function()
        vim.diagnostic.open_float({ border = "single" })
      end,
      "Open floating window",
    },
    N = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "Goto previous diagnosis",
    },
    n = {
      function()
        vim.diagnostic.goto_next()
      end,
      "Goto next diagnosis",
    },
  },
  f = {
    function()
      vim.lsp.buf.format({ timeout_ms = 30000 })
    end,
    "Format code",
  },
  i = {
    function()
      vim.lsp.buf.incoming_calls()
    end,
    "Show incoming calls",
  },
  o = {
    function()
      vim.lsp.buf.outgoing_calls()
    end,
    "Show outgoing calls",
  },
  r = {
    function()
      vim.lsp.buf.rename()
    end,
    "Rename symbol under cursor",
  },
  T = {
    function()
      vim.lsp.buf.type_definition()
    end,
    "Go to type definition",
  },
  w = {
    name = "workspace",
    D = {
      function()
        vim.lsp.diagnostic.set_loclist({ workspace = true })
      end,
      "Show diagnostics for current workspace",
    },
    a = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },
    l = {
      function()
        print(vim.lsp.buf.list_workspace_folders())
      end,
      "List workspace folders",
    },
    r = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },
    s = {
      function()
        vim.lsp.buf.workspace_symbol()
      end,
      "Search for symbol in workspace",
    },
  },
}, {
  prefix = "<leader>l",
})
which_key.register({
  ["<C-h>"] = {
    function()
      vim.lsp.buf.signature_help()
    end,
    "Signature Help",
  },
}, {
  mode = "i",
})
