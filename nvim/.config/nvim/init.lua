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
  "nvim-treesitter/nvim-treesitter",
  "nvim-tree/nvim-tree.lua",
  "folke/trouble.nvim",
  "andweeb/presence.nvim",
  { 
    "dgagn/diagflow.nvim",
    event = 'LspAttach'
  },
  {
    "Ohio2/nvim-libmodal-hotfix",
    lazy = true,
    branch = "cmp_num_str_hotfix",
  },
  "nvim-telescope/telescope.nvim"
})

vim.opt.fillchars = {eob = " "}
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.api.nvim_set_option("clipboard", "unnamed")

require("local_lsp")
require("local_filetree")
require("local_lualine")
require("local_panes")
require("local_discord")

require("nvim-treesitter.configs").setup({
    ensure_installed = {"c", "cpp", "lua", "vim", "bash", "zig"},
    auto_install = true,
    sync_install = true,

    highlight = {
      enable = true,
      disable = {"zig"},  
    },
    ident = {
      enable = true
    }
})


vim.opt.termguicolors = true
vim.cmd[[set number]]
