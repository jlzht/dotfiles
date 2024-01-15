local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }
local unbind_opts = { noremap = true}

keymap('', '<up>', '<nop>', unbind_opts)
keymap('', '<down>', '<nop>', unbind_opts)
keymap('', '<left>', '<nop>', unbind_opts)
keymap('', '<right>', '<nop>', unbind_opts)
keymap('n', '<leader>]', ':setlocal spell spelllang=pt_br<CR>', default_opts)

keymap('n', '<C-x>', ':BufferLinePickClose<CR>', default_opts)
keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', default_opts)
keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', default_opts)

keymap('n', '<leader>f', ':Telescope find_files <CR>', default_opts)
keymap('n', '<leader>s', ':Telescope treesitter <CR>', default_opts)
keymap('n', '<leader>m', ':Telescope man_pages <CR>', default_opts)
