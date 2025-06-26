-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--

return {
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<M-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<M-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<M-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<M-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<M-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  {
    'fedepujol/move.nvim',
    opts = {},
    config = function()
      local opts = { noremap = true, silent = true }

      require('move').setup {
        word = { enable = true },
        char = { enable = true },
      }

      -- plugin repo: https://github.com/fedepujol/move.nvim
      -- Normal-mode
      vim.keymap.set('n', '<C-j>', ':MoveLine(1)<CR>', opts)
      vim.keymap.set('n', '<C-k>', ':MoveLine(-1)<CR>', opts)

      vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
      vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

      -- Visual-mode
      vim.keymap.set('v', '<C-j>', ':MoveBlock(1)<CR>', opts)
      vim.keymap.set('v', '<C-k>', ':MoveBlock(-1)<CR>', opts)
      vim.keymap.set('v', '<C-h>', ':MoveHBlock(-1)<CR>', opts)
      vim.keymap.set('v', '<C-l>', ':MoveHBlock(1)<CR>', opts)
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

  {
    'rcarriga/nvim-notify',
    opts = {
      timeout = 2000,
      render = 'compact',
      stages = 'fade',
      level = 3,
      top_down = false,
    },
  },

  {
    'folke/noice.nvim',
    config = function()
      require('noice').setup {
        timeout = 1000,
        on_open = function(win)
          vim.api.nvim_win_set_config(win, { focusable = false })
        end,
        views = {
          cmdline_popup = {
            position = {
              row = 5,
              col = '30%',
            },
            size = {
              width = 60,
              height = 'auto',
            },
          },
          popupmenu = {
            relative = 'editor',
            position = {
              row = 8,
              col = '30%',
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = 'rounded',
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
            },
          },
        },

        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        --
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = true, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      }
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },

  {
    'davidmh/mdx.nvim',
    config = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
