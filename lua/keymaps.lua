local options = { noremap = true, silent = true }
local map = vim.keymap.set

map('i', 'jj', '<Esc>', options)

map('n', '<Leader>e', ':Neotree  toggle <cr>', options)
map('n', '<Leader>o', ':Neotree focus <cr>', options)

map('n', '<leader>w', ':update <cr>', options)
map('n', '<leader>c', ':BufferClose <cr>', options)

map('n', '[b', '<Cmd>BufferPrevious<CR>', options)
map('n', ']b', '<Cmd>BufferNext<CR>', options)
map('n', '[[b', '<Cmd>BufferMovePrevious<CR>', options)
map('n', ']]b', '<Cmd>BufferMoveNext<CR>', options)
