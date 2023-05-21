-- Split navigation
vim.keymap.set({'n', 't'}, '<C-h>', '<C-w>h', {desc = 'Right navigate'})
vim.keymap.set({'n', 't'}, '<C-j>', '<C-w>j', {desc = 'Down navigate'})
vim.keymap.set({'n', 't'}, '<C-k>', '<C-w>k', {desc = 'Up navigate'})
vim.keymap.set({'n', 't'}, '<C-l>', '<C-w>l', {desc = 'Right navigate'})

-- Toggle syntax highlighting on and off
vim.keymap.set('n', '<CR>', ':nohls<CR><CR>', {desc = 'Toggle off syntax highlight when done'})
