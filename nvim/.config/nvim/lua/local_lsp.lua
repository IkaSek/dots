local lspconfig = require("lspconfig")
local libmodal = require("libmodal")
local cmp = require("cmp")
local lsp_signature = require("lsp_signature")
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local diagflow = require("diagflow")
local trouble = require("trouble")

diagflow.setup({})

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
lsp_signature.setup({})

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig_conf = {capabilities = capabilities}

lspconfig.ols.setup(lspconfig_conf)
lspconfig.clangd.setup(lspconfig_conf)
lspconfig.kotlin_language_server.setup(lspconfig_conf)
lspconfig.java_language_server.setup(lspconfig_conf)
lspconfig.rust_analyzer.setup(lspconfig_conf)
lspconfig.zls.setup(lspconfig_conf)
lspconfig.mesonlsp.setup(lspconfig_conf)

trouble.setup()

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local opts = { buffer = ev.buf }
    LSPMode = {
      d = libmodal.mode.map.fn(vim.lsp.buf.declaration, opts),
      dd = libmodal.mode.map.fn(vim.lsp.buf.definition, opts),
      i = libmodal.mode.map.fn(vim.lsp.buf.implementation, opts),
      sh = libmodal.mode.map.fn(vim.lsp.buf.signatuure_help, opts),
      dt = libmodal.mode.map.fn(vim.lsp.buf.type_definition, opts),
      r = libmodal.mode.map.fn(vim.lsp.buf.rename, opts),
      a = libmodal.mode.map.fn(vim.lsp.buf.code_action, opts),
      dr = libmodal.mode.map.fn(vim.lsp.buf.references, opts),
      da = libmodal.mode.map.fn(function() trouble.toggle() end),
      fm = libmodal.mode.map.fn(vim.lsp.buf.format, opts),
    }
    vim.keymap.set('v', '<space>ca', vim.lsp.buf.code_action, opts)
  end,
})
vim.keymap.set('n', ',', function() libmodal.mode.enter('LSP', LSPMode) end)
