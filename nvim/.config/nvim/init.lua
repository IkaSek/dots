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
	{
		"mrjones2014/legendary.nvim",
		lazy = false,
		config = function() end,
	},
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
		opts = {},

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
	-- "andweeb/presence.nvim",
	"tanvirtin/monokai.nvim",
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"ibhagwan/fzf-lua",
		keys = {
			{
				"<leader>fg",
				"<cmd>FzfLua grep_project<cr>",
			},
			{
				"<leader>ff",
				"<cmd>FzfLua files<cr>",
			},
			{
				"<leader>fs",
				"<cmd>FzfLua tags<cr>",
			},
		},
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
	{
		"olimorris/codecompanion.nvim",
		dependencies = {

			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
			"nvim-telescope/telescope.nvim", -- Optional: For using slash commands
			{ "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
		},
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			padding = true,
			sticky = true,
			ignore = nil,

			toggler = {
				line = "gcc",
				block = "gbc",
			},
			opleader = {
				line = "gc",
				block = "gb",
			},
			extra = {
				aboe = "gcO",
				below = "gco",
				eol = "gca",
			},
			mappings = {
				basic = true,
				extra = true,
			},
			pre_hook = nil,
			post_hook = nil,
		},
		config = function()
			local ft = require("Comment.ft")
			ft({ "c", "cpp" }, "/* %s */")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	"nvim-pack/nvim-spectre",
	"tpope/vim-fugitive",
  "mhartington/formatter.nvim",
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
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

vim.g.gutentags_ctags_extra_args = { '--fields=+niazS', '--extras=+q' }

vim.keymap.set("n", "<leader>Dl", function()
	vim.lsp.buf.hover()
end)

require("local_lsp")
require("local_filetree")
require("local_lualine")
--require("local_discord")

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
npairs.add_rule(Rule("<", ">", "html"))


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

vim.api.nvim_set_keymap(
  'n',
  '<leader>ld',
  '<cmd>lua vim.lsp.buf.hover()',
  { noremap = true, silent = true }
)

require("include_guard")
