require("toggleterm").setup{
  size = 16,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  autochdir = false,
  shade_terminals = false,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  persist_mode = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
  auto_scroll = true
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

require('telescope.pickers.layout_strategies').bottom = function(picker, max_columns, max_lines, layout_config)
	local layout = require('telescope.pickers.layout_strategies').bottom_pane(picker, max_columns, max_lines, layout_config)
    layout.results.borderchars = {'', '', '', '', '', '', '', ''}
    layout.prompt.title = ''
    layout.prompt.borderchars = {'─', '', '', '', '─', '─', '', ''}
    layout.results.title = ''
	return layout
end

require('telescope').setup {
  defaults = {
    preview = false,
    layout_strategy = "bottom",
    layout_config = {
      bottom_pane = {
        height = 17,
        prompt_position = "top"
      }
    },
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
  },
  extensions = {
  }
}
