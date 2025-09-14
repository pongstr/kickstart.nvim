--
-- Toggle relative line numbers
vim.api.nvim_set_keymap('n', '<leader>ln', ':set relativenumber!<CR>', { noremap = true })

-- Show Undo List with Telescope
vim.keymap.set('n', '<leader>u', ':Telescope undo<CR>', { desc = '[U]ndo List' })

-- Show LazyGit
vim.keymap.set('n', '<leader>hg', ':LazyGit<CR>', { desc = 'Lazy[g]it: Show Window' })

-- Visual-mode commands
vim.keymap.set('n', '<C-a>', ':Dashboard<CR>', { desc = 'Show D[a]shboard', silent = true })

vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })
vim.keymap.set('n', '<Tab>', '>>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', '<<', { noremap = true, silent = true })

return {}
