local lspconfig = require("lspconfig")
local libmodal = require("libmodal")
local cmp = require("cmp")
local lsp_signature = require("lsp_signature")
local cmp_nvim_lsp = require('cmp_nvim_lsp')

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
      ca = libmodal.mode.map.fn(vim.lsp.buf.code_action, opts),
      dr = libmodal.mode.map.fn(vim.lsp.buf.references, opts),
      ['<Down>'] = function() vim.cmd('normal! j') end,
      ['<Left>'] = function() vim.cmd('normal! h') end,
      ['<Right>'] = function() vim.cmd('normal! l') end,
      ['<Up>'] = function() vim.cmd('normal! k') end,
    }
    vim.keymap.set('v', '<space>ca', vim.lsp.buf.code_action, opts)
  end,
})
vim.keymap.set('n', '<space>cm', function() libmodal.mode.enter('LSP', LSPMode) end, {nowait = false})
