-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  { -- NeoTree: File explorer
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        popup_border_style = 'rounded',
        use_libuv_file_watcher = false,
        hijack_netrw_behavior = 'enable',
        window = {
          position = 'float',
          mappings = {
            ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
            ['\\'] = { 'close_window' },
          },
        },
        source_selector = {
          winbar = false,
          statusline = false,
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              '.git',
              'node_modules',
              '__pycache__',
            },
            never_show = { '.git' },
          },
        },
        git_status = {
          symbols = {
            -- Change type
            added = '\\udb81\\udc15', -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = '✖', -- this can only be used in the git_status source
            renamed = '󰁕', -- this can only be used in the git_status source
            -- Status type
            untracked = '',
            ignored = '',
            unstaged = '󰄱',
            staged = '',
            conflict = '',
          },
        },
      }

      local tree = require 'neo-tree.command'
      local map = function(key, cmd, opts)
        vim.keymap.set('n', key, cmd, opts)
      end

      map('<leader>fe', function()
        tree.execute { toggle = true }
      end, { desc = 'Explorer NeoTree (root dir)' })

      map('<leader>be', function()
        tree.execute { source = 'buffers', toggle = true }
      end, { desc = 'Buffer explorer' })

      map('<leader>e', '<leader>fe', { desc = 'Explorer NeoTree (root dir)', remap = true })
      map('<leader>E', '<leader>fE', { desc = 'Explorer NeoTree (cwd)', remap = true })
    end,
  },
}
