local tree = require("nvim-tree")
local tree_api = require("nvim-tree.api")

tree.setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
vim.keymap.set("n", "tr", function()
	tree_api.tree.toggle({ focus = true })
end)
