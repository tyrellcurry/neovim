-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Custom keymaps

-- Diagnosis open in a floating window
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Show diagnostic [L]ist' })

-- Set '<leader>y' to yank to clipboard
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+y')
-- Set '<leader>p' to paste from clipboard
vim.keymap.set('v', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>P', '"+P')
vim.keymap.set('n', '<leader>P', '"+P')

-- Map change (c) to use the black hole register so it doesn't save deleted text
vim.keymap.set({ 'n', 'v' }, 'c', '"_c', { noremap = true })
vim.keymap.set('n', 'cc', '"_cc', { noremap = true })

-- Map delete to save in 'a' register
vim.keymap.set({ 'n', 'v' }, 'd', '"ad', { noremap = true })
vim.keymap.set('n', 'dd', '"add', { noremap = true })
vim.keymap.set('v', 'd', '"ad', { noremap = true })
vim.keymap.set('n', '<leader>P', '"+P')

-- Map yank to save in 'a' register
vim.keymap.set({ 'n', 'v' }, 'y', '"ay', { noremap = true })

-- Map paste to paste from 'a' register
vim.keymap.set('n', 'p', '"ap', { noremap = true })
vim.keymap.set('v', 'p', '"ap', { noremap = true })
vim.keymap.set('n', 'P', '"aP', { noremap = true })
vim.keymap.set('v', 'P', '"aP', { noremap = true })
vim.keymap.set('n', '<leader>g', ':%y+<CR>', { desc = 'Yank entire buffer to clipboard' })

-- Open TODOs
vim.keymap.set('n', '<leader>td', '<cmd>TodoTelescope<CR>', { desc = 'Open [T]o[D]os' })
