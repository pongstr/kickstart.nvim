return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.g.lualine_laststatus = vim.o.laststatus

      if vim.fn.argc(-1) > 0 then
        vim.o.statusline = ' '
      else
        vim.o.laststatus = 0
      end

      local theme = require 'lualine.themes.auto'

      theme.normal.c.bg = '#1E1E2E'
      theme.inactive.c.bg = '#1E1E2E'

      require('lualine').setup {
        options = {
          theme = theme,
          globalstatus = true,
          disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter' } },
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = {
            {
              'filetype',
              color = { fg = '#7AA2F7' },
              icon_only = true,
              separator = { right = '' },
              padding = { left = 1, right = 1 },
            },
            {
              'filename',
              color = { bg = '#232433' },
              file_status = true,
              separator = { right = '' },
              padding = { left = 1, right = 1 },
            },
          },
          lualine_x = {
            {
              'diff',
              symbols = {
                added = ' ',
                modified = ' ',
                removed = ' ',
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },

          lualine_y = {
            { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
            { 'location', padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return ' ' .. os.date '%R 👾'
            end,
          },
        },
      }
    end,
  },
}
