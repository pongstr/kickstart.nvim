-- Toggle relative line numbers
vim.api.nvim_set_keymap('n', '<leader>ln', ':set relativenumber!<CR>', { noremap = true, silent = true })

-- Show Undo List with Telescope
vim.keymap.set('n', '<leader>u', ':Telescope undo<CR>', { desc = '[U]ndo List' })

-- Show LazyGit
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { desc = 'Open Lazy[G]it' })

return {}
