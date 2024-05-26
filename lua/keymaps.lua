local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map('i', 'jj', '<Esc>', options)

map('n', '<Leader>e', ':Neotree toggle <cr>', options)
map('n', '<Leader>o', ':Neotree focus <cr>', options)
map('n', '<leader>w', ':update <cr>', options)
map('n', '<leader>c', ':BufferClose <cr>', options)

local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '[b', '<Cmd>BufferPrevious<CR>', opts)
map('n', ']b', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '[[b', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', ']]b', '<Cmd>BufferMoveNext<CR>', opts)
