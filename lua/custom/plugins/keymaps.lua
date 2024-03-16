-- Toggle relative line numbers
vim.api.nvim_set_keymap('n', '<leader>ln', ':set relativenumber!<CR>', { noremap = true, silent = true })

-- Show Undo List with Telescope
vim.keymap.set('n', '<leader>u', ':Telescope undo<CR>', { desc = '[U]ndo List' })

-- Show LazyGit
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { desc = 'Lazy[g]it: Show Window' })

-- Move Plugin: 'fedepujol/move.nvim'
-- commands for moving lines or blocks horizontally doesn't work
local opts = { noremap = true, silent = true }

-- Normal-mode commands
vim.keymap.set('n', '<C-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<C-k>', ':MoveLine(-1)<CR>', opts)

vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<C-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<C-k>', ':MoveBlock(-1)<CR>', opts)

vim.keymap.set('n', '<M-s>', ':help')

return {}
