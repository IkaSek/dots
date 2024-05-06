local lspconfig = require("lspconfig")
local libmodal = require("libmodal")

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
