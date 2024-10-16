vim.g.mapleader = "z"

local lazyp = vim.fn.stdpath("data") .. "~/.local/share/nvim/lazy.nvim"
if not vim.loop.fs_stat(lazyp) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazyp,
	})
end
vim.opt.rtp:prepend(lazyp)

local lazy = require("lazy").setup({
	"nvim-tree/nvim-web-devicons",
	"neovim/nvim-lspconfig",
	"bluz71/vim-moonfly-colors",
	"nvim-lualine/lualine.nvim",
  { 
    "hrsh7th/nvim-cmp",
  },
	"Tetralux/odin.vim",
	"hrsh7th/cmp-nvim-lsp",
	"dcampos/nvim-snippy",
	"dcampos/cmp-snippy",
	"ray-x/lsp_signature.nvim",
	"esensar/neovim-kotlin",
	"nvim-treesitter/nvim-treesitter",
	"nvim-tree/nvim-tree.lua",
	"ludovicchabant/vim-gutentags",
  "https://github.com/justinmk/vim-syntax-extra",
	{
		"nvim-neotest/nvim-nio",
		--opts = {
		--	library = { plugins = { "nvim-dap-ui" }, types = true },
		--},
	},
	--{
	--  "folke/noice.nvim",
	--  event = "VeryLazy",
	--  opts = {},
	--  dependencies = {
	--    "MunifTanjim/nui.nvim",
	--    --"rcarriga/nvim-notify",
	--  },
	--},
	{
		"folke/trouble.nvim",
		opts = {
    },

		keys = {
			{
				"<leader>da",
				"<cmd>Trouble diagnostics toggle<cr>",
			},
			{
				"<leader>dq",
				"<cmd>Trouble qflist toggle<cr>",
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<leader>ga",
				"<cmd>DapNew<cr>",
			},
			{
				"<leader>gd",
				"<cmd>DapDisconnect<cr>",
			},
			{
				"<leader>gb",
				"<cmd>DapToggleBreakpoint<cr>",
			},
			{
				"<leader>gc",
				"<cmd>DapContinue<cr>",
			},
			{
				"<leader>gs",
				"<cmd>DapStepOver<cr>",
			},
			{
				"<leader>gS",
				"<cmd>DapStepInto<cr>",
			},
			{
				"<leader>go",
				"<cmd>DapStepOut<cr>",
			},
			{
				"<leader>gk",
				"<cmd>DapTerminate<cr>",
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	"andweeb/presence.nvim",
	"tanvirtin/monokai.nvim",
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua")
		end,
	},
	--  "nvim-lua/plenary.nvim",
	--{
	--	"dgagn/diagflow.nvim",
	--	event = "LspAttach",
	--},
	--{
	--	"Iron-E/nvim-libmodal",
	--	lazy = true,
	--},
	"APZelos/blamer.nvim",
	{
		"ej-shafran/compile-mode.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.g.compile_mode = {
				baleia_setup = true,
			}
		end,
	},
})

vim.opt.fillchars = { eob = "~" }
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.opt.relativenumber = true
vim.o.tags = "./tags;,tags"

vim.keymap.set("n", "<leader>Dd", function()
	vim.lsp.buf.declaration()
end)
vim.keymap.set("n", "<leader>DD", function()
	vim.lsp.buf.definition()
end)
vim.keymap.set("n", "<leader>Di", function()
	vim.lsp.buf.implementation()
end)
vim.keymap.set("n", "<leader>Dsh", function()
	vim.lsp.buf.signature_help()
end)
vim.keymap.set("n", "<leader>Ddt", function()
	vim.lsp.buf.type_definition()
end)
vim.keymap.set("n", "<leader>Dr", function()
	vim.lsp.buf.rename()
end)
vim.keymap.set("n", "<leader>Ddr", function()
	vim.lsp.buf.references()
end)
vim.keymap.set("n", "<leader>Dl", function()
	vim.lsp.buf.hover()
end)

require("local_lsp")
require("local_filetree")
require("local_lualine")
require("local_discord")

require("dap").adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

require("dap").configurations.c = {
	{
		name = "Attach on :1234",
		type = "gdb",
		request = "attach",
		target = "localhost:1234",
		cwd = "${workspaceFolder}",
	},
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
	},
}

vim.opt.termguicolors = true
vim.cmd([[set number]])
vim.cmd([[colorscheme monokai]])
vim.opt.guifont = "ZedMono Nerd Font Mono Bold 18"
--vim.opt.mouse = ""
vim.opt.colorcolumn = "80"

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  float = true,
})

require("include_guard")
