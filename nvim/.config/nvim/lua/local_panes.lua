local modal = require("libmodal")

local PanesMode = {
  h = modal.mode.map.fn(function() vim.cmd('wincmd h') end),
  l = modal.mode.map.fn(function() vim.cmd('wincmd l') end),
  j = modal.mode.map.fn(function() vim.cmd('wincmd j') end),
  k = modal.mode.map.fn(function() vim.cmd('wincmd k') end),
  v = modal.mode.map.fn(function() vim.cmd('vsplit') end),
  c = modal.mode.map.fn(function() vim.cmd('split') end),
  rh = modal.mode.map.fn(function() vim.cmd('resize +1') end),
  rl = modal.mode.map.fn(function() vim.cmd('resize -1') end),
  rk = modal.mode.map.fn(function() vim.cmd('vertical resize +1') end),
  rj = modal.mode.map.fn(function() vim.cmd('vertical resize -1') end)

}

vim.keymap.set('n', '<space>pm', function() modal.mode.enter('PANES', PanesMode) end)
