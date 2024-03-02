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
  {
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        no_italic = true,
        transparent_background = true,
      }
      require('catppuccin').load()
      vim.cmd.colorscheme 'catppuccin'
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

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', lazy = false, opts = {
    padding = true,
    sticky = true,
    ignore = nil,
  } },

  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    config = function()
      require('gitsigns').setup()

      local map = function(key, cmd, opts)
        vim.keymap.set('n', key, cmd, opts)
      end

      map('<leader>pg', '<cmd>lua require"gitsigns".preview_hunk()<CR>', { desc = 'Gitsign: Preview [H]unk' })
      map('<leader>pR', '<cmd>lua require"gitsigns".reset_hunk()<CR>', { desc = 'Gitsign: [R]eset Hunk' })
      map('<leader>pS', '<cmd>lua require"gitsigns".stage_buffer()<CR>', { desc = 'Gitsign: [S]tage Buffer' })
      map('<leader>px', '<cmd>lua require"gitsigns".reset_buffer_index()<CR>', { desc = 'Gitsign: Reset B[u]ffer Index' })
    end,
  },

  { -- Autoformat: Format code on save
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        typescriptreact = { { 'prettierd', 'prettier' } },
        css = { 'prettierd', 'prettier' },
      },
    },
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
}
