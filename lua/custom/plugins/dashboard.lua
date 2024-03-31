return {
  {
    {
      'nvimdev/dashboard-nvim',
      dependencies = {
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      },
      event = 'VimEnter',
      opts = function()
        local logo = [[
      ➖⬛⬛➖➖➖➖⬛
      ➖➖🟨🟧➖➖➖🟧
      ➖➖➖🟨🟨🟨🟨🟧
      🟧🟧➖🟨⬛🟨🟨⬛ 
      🟧🟧➖🟥🟨🟨🟨🟧
      ➖🟧➖🟨🟧🟧🟧
      ➖🟧🟨🟧🟨🟧🟨
      ➖➖🟨🟧🟫🟫🟧
      ➖➖  pongstr.nvim
    ]]

        logo = string.rep('\n', 8) .. logo .. '\n\n'

        local opts = {
          theme = 'doom',
          hide = {
            statusline = false,
          },
          config = {
            week_header = { enable = false },
            disable_move = true,
            project = { enable = false },
            mru = { label = 'Recent Files', limit = 2, cwd_only = true },
            header = vim.split(logo, '\n'),

            center = {
              { action = 'ene | startinsert', desc = ' New file', icon = ' ', key = 'n' },
              { action = 'Telescope find_files', desc = ' Find file', icon = ' ', key = 'f' },
              { action = 'Telescope oldfiles', desc = ' Recent files', icon = ' ', key = 'r' },
              { action = 'Telescope live_grep', desc = ' Find text', icon = ' ', key = 'l' },
              { action = 'LazyGit', desc = ' Lazy Git', icon = '󰒲 ', key = 'g' },
              { action = 'Mason', desc = ' Plugins', icon = ' ', key = 'p' },
              { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
            },

            footer = function()
              local stats = require('lazy').stats()
              local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
              return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
            end,
          },
        }

        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == 'lazy' then
          vim.cmd.close()
          vim.api.nvim_create_autocmd('User', {
            pattern = 'DashboardLoaded',
            callback = function()
              require('lazy').show()
            end,
          })
        end

        return opts
      end,
    },
  },
}
