require('nvim-navic').setup({
	highlight = true
})

vim.g.navic_silence = true


vim.api.nvim_set_hl(0, "NavicIconsNamespace", { link = "Namespace" })
vim.api.nvim_set_hl(0, "NavicIconsPackage", { link = "Package" })
vim.api.nvim_set_hl(0, "NavicIconsClass", { link = "Class" })
vim.api.nvim_set_hl(0, "NavicIconsMethod", { link = "Method" })
vim.api.nvim_set_hl(0, "NavicIconsProperty", { link = "Property" })
vim.api.nvim_set_hl(0, "NavicIconsField", { link = "Field" })
vim.api.nvim_set_hl(0, "NavicIconsConstructor", { link = "Constructor" })
vim.api.nvim_set_hl(0, "NavicIconsEnum", { link = "Enum" })
vim.api.nvim_set_hl(0, "NavicIconsInterface", { link = "Interface" })
vim.api.nvim_set_hl(0, "NavicIconsFunction", { link = "Function" })
vim.api.nvim_set_hl(0, "NavicIconsVariable", { link = "Variable" })
vim.api.nvim_set_hl(0, "NavicIconsConstant", { link = "Constant" })
vim.api.nvim_set_hl(0, "NavicIconsString", { link = "String" })
vim.api.nvim_set_hl(0, "NavicIconsNumber", { link = "Number" })
vim.api.nvim_set_hl(0, "NavicIconsBoolean", { link = "Boolean" })
vim.api.nvim_set_hl(0, "NavicIconsArray", { link = "Array" })
vim.api.nvim_set_hl(0, "NavicIconsObject", { link = "Function" })
vim.api.nvim_set_hl(0, "NavicIconsKey", { link = "Key" })
vim.api.nvim_set_hl(0, "NavicIconsNull", { link = "Null" })
vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { link = "EnumMember" })
vim.api.nvim_set_hl(0, "NavicIconsStruct", { link = "Struct" })
vim.api.nvim_set_hl(0, "NavicIconsEvent", { link = "Event" })
vim.api.nvim_set_hl(0, "NavicIconsOperator", { link = "Operator" })
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { link = "Type" })
vim.api.nvim_set_hl(0, "NavicText", { link = "Text" })
-- vim.api.nvim_set_hl(0, "NavicSeparator", { link = "" })
