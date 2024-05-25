local lualine = require("lualine")


local modes = {
  ['c'] = {'COMMAND-LINE', '#BA62AA'},
  ['ce'] = {'NORMAL EX', '#763290'},
  ['cv'] = {'EX', '#572D97'},
  ['i'] = {'INSERT', '#B02584'},
  ['v'] = {'VISUAL', '#7a3787'},
  ['n'] = {'NORMAL', '#662487'},
  -- other modes if i ever need them https://github.com/Iron-E/nvim-libmodal 
  ['LSP'] = {'#5425E6'},
  ['PANES'] = {'#580c85'}
}

vim.api.nvim_create_autocmd('ModeChanged', {callback = function()
  lualine.refresh({scope = 'window',  place = {'statusline'}})
end})

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    disabled_filetypes = {'NvimTree'}   
  },
  sections = {
    lualine_a = {
      function() 
        local mode_color, mode_name
        if vim.g.libmodalActiveModeName then
          mode_name = vim.g.libmodalActiveModeName
          mode_color = modes[mode_name]
        else
          local current_mode = modes[vim.api.nvim_get_mode().mode]
          mode_name = current_mode[1]
          mode_color = current_mode[2]
        end

        vim.api.nvim_set_hl(0, 'LualineViMode', {fg = mode_color, bold = true})
        return mode_name..' '
      end,
      color = Mode,
    },
    lualine_b = {
      'branch', 'diff', 'diagnostics',
    },
    lualine_c = {
      'filename',
      color = Filename,
    },
    -- TODO: time
    -- lualine_w = {function() end}
    lualine_x = {
      'encoding', 'fileformat', 'filetype',
      color = File,
    },
    lualine_y = {
      'progress',
    },
    lualine_z = {
      'location'
    }
  }
})
