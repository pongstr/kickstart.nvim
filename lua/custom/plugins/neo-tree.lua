-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { 'magick' },
    },
  },
  {
    'pongstr/image.nvim',
    -- NOTE: temporarily use the fork
    -- as of `4c51d62` image preview is borked and has two related PRs, just patch this file for now:
    -- ~/.local/share/nvim/lazy/image.nvim/lua/image/renderer.lua (replace the lines with)
    -- L-107: local is_folded = vim.fn.foldclosed(original_y + 1) ~= -1
    -- L-180: local screen_pos = vim.fn.screenpos(image.window, math.max(1, original_y), original_x)
    dependencies = { 'luarocks.nvim' },
    opts = {
      backend = 'kitty',
      enable = true,
    },
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      { 'pongstr/image.nvim', opts = { enable = true, backend = 'kitty' } },
    },
    lazy = false,
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
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
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
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
    },
  },
}
