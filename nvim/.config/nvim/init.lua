vim.cmd[[colorscheme ikark]]
local lazyp = vim.fn.stdpath("data") .. "~/.local/share/nvim/lazy.nvim"
if not vim.loop.fs_stat(lazyp) then
	vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazyp})
end
vim.opt.rtp:prepend(lazyp)

local lazy = require("lazy").setup({
  "nvim-tree/nvim-web-devicons",
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
  "nvim-treesitter/nvim-treesitter",
  "nvim-tree/nvim-tree.lua",
  "folke/trouble.nvim",
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
    end
  },
  --  "nvim-lua/plenary.nvim",
  { 
    "dgagn/diagflow.nvim",
    event = 'LspAttach'
  },
  {
    "Iron-E/nvim-libmodal",
    lazy = true
  },
  "APZelos/blamer.nvim",
})

vim.opt.fillchars = {eob = "~"}
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.opt.relativenumber = true


require("local_lsp")
require("local_filetree")
require("local_lualine")
require("local_discord")

vim.opt.termguicolors = true
vim.cmd[[set number]]
vim.cmd[[colorscheme monokai]]
vim.opt.guifont = "ZedMono Nerd Font Mono Bold 18"
vim.opt.mouse = ""
