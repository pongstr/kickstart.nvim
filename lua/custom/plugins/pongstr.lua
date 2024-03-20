-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--

return {
  {
    'fedepujol/move.nvim',
    opts = {},
    config = function()
      require('move').setup()
    end,
  },

  { -- LazyGit
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
  },

  { -- Autoformat:
    'elentok/format-on-save.nvim',
    config = function()
      local format_on_save = require 'format-on-save'
      local formatters = require 'format-on-save.formatters'

      format_on_save.setup {
        exclude_path_patterns = {
          '.git',
          '__pycache__',
          '/node_modules/',
          '.local/share/nvim/lazy',
        },
        formatter_by_ft = {
          css = formatters.lsp,
          html = formatters.lsp,
          python = formatters.black,
          typescript = formatters.prettierd,
          typescriptreact = formatters.prettierd,
        },
      }
    end,
  },

  { -- NeoTree: File explorer
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      '3rd/image.nvim',
    },
    config = function()
      require('neo-tree').setup {
        use_libuv_file_watcher = false,
        window = {
          position = 'float',
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
      }

      local tree = require 'neo-tree.command'
      local map = function(key, cmd, opts)
        vim.keymap.set('n', key, cmd, opts)
      end

      map('<leader>fe', function()
        tree.execute { toggle = true }
      end, { desc = 'Explorer NeoTree (root dir)' })

      map('<leader>fE', function()
        tree.execute { toggle = true, dir = vim.loop.cwd() }
      end, { desc = 'Explorer NeoTree (cwd)' })

      map('<leader>be', function()
        tree.execute { source = 'buffers', toggle = true }
      end, { desc = 'Buffer explorer' })

      map('<leader>e', '<leader>fe', { desc = 'Explorer NeoTree (root dir)', remap = true })
      map('<leader>E', '<leader>fE', { desc = 'Explorer NeoTree (cwd)', remap = true })
    end,
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- 'rcarriga/nvim-notify',
    },
  },
}
