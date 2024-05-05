vim.cmd[[colorscheme ikark]]
local lazyp = vim.fn.stdpath("data") .. "~/.local/share/nvim/lazy.nvim"
if not vim.loop.fs_stat(lazyp) then
	vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazyp})
end
vim.opt.rtp:prepend(lazyp)

local lazy = require("lazy").setup({
	"neovim/nvim-lspconfig",
	"bluz71/vim-moonfly-colors",
	"nvim-lualine/lualine.nvim",
	"hrsh7th/nvim-cmp",
	"Tetralux/odin.vim",
	"hrsh7th/cmp-nvim-lsp",
	"dcampos/nvim-snippy",
	"dcampos/cmp-snippy",
	"ray-x/lsp_signature.nvim",
	"esensar/neovim-kotlin",
  { 
    "nvim-treesitter/nvim-treesitter",
    commit = "73fdd31",
  },
  "nvim-tree/nvim-tree.lua",
  {
    "Ohio2/nvim-libmodal-hotfix",
    lazy = true,
    branch = "cmp_num_str_hotfix",
  },
  "nvim-telescope/telescope.nvim"
})

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("snippy").expand_snippet(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort,
		['<CR>'] = cmp.mapping.confirm({select = true})
	}),
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
		{name = 'snippy'}
	}, {
		{name = 'buffer'}
	})
})

require("lsp_signature").setup({})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require("lspconfig")

lspconfig_conf = {capabilities = capabilities}

lspconfig.ols.setup(lspconfig_conf)
lspconfig.clangd.setup(lspconfig_conf)
lspconfig.kotlin_language_server.setup(lspconfig_conf)
lspconfig.java_language_server.setup(lspconfig_conf)
lspconfig.rust_analyzer.setup(lspconfig_conf)
lspconfig.zls.setup(lspconfig_conf)
lspconfig.mesonlsp.setup(lspconfig_conf)

require("lualine").setup {
	options = {
		icons_enabled = false,
	}
}

vim.opt.fillchars = {eob = " "}
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.api.nvim_set_option("clipboard","unnamed")

require("lsp")

require("nvim-treesitter.configs").setup({
    ensure_installed = {"c", "cpp", "lua", "vim", "bash", "zig"},
    auto_install = true,
    sync_install = true,

    highlight = {
      enable = true,
    },
    ident = {
      enable = true
    }
})

vim.opt.termguicolors = true
vim.cmd[[set number]]

