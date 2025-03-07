local c = require("core.colorscheme.palette")

local theme = {
  inactive = {
    a = {fg = c.wh1, bg = c.bl1, gui = 'bold'},
    b = {fg = c.wh1, bg = c.bl1},
    c = {fg = c.wh1, bg = c.bg0},
  },
  normal = {
    a = {fg = c.bl1, bg = c.gr0, gui = 'bold'},
    b = {fg = c.wh1, bg = c.bl0},
    c = {fg = c.wh1, bg = c.bl1},
  },
  visual = {a = {fg = c.bl1, bg = c.mg0, gui = 'bold'}},
  replace = {a = {fg = c.bl1, bg = c.rd0, gui = 'bold'}},
  insert = {a = {fg = c.bl1, bg = c.bu0, gui = 'bold'}},
  command = {a = {fg = c.bl1, bg = c.yw0, gui = 'bold'}},
}

local highlights = {
  fill = { bg = c.bl1 },
  background = { bg = c.bl1, fg = c.fg1 },
  buffer_visible = { fg = c.fg2, bg = c.bl1 },
  buffer_selected = { fg = c.fg0, bg = c.bg3},
  modified = { fg = c.cy0, bg = c.bl1 }, --
  modified_visible = { fg = c.cy0, bg = c.bl1 },
  modified_selected = { fg = c.cy1, bg = c.bg3},
  warning = {bg = c.bl1},
  warning_selected = {bg = c.bg3},
  error = {bg = c.bl1},
  error_selected = {bg = c.bg3},
  pick = {bg = c.bl1},
  pick_selected = { bg = c.bg3},
  separator = { fg = c.bl0, bg = c.bl0 },
  indicator_visible = { fg = c.fg1, bg = c.bl1 },
  indicator_selected = { fg = c.bg3, bg = c.bg3 }
}

local highlight = {
  "Gray",
}

require("lualine").setup{
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename', 'branch', 'diff', 'diagnostics'},
    lualine_c = {},
    lualine_x = {'encoding','filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

local bufferline = require('bufferline')
bufferline.setup {
  options = {
    mode = "buffers",
    numbers = "none",
    modified_icon = '●',
    max_name_length = 18,
    max_prefix_length = 12,
    truncate_names = true,
    tab_size = 24,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    indicator = { icon = '', style = 'none'},
    show_tab_indicators = true,
    separator_style = { '', '' },
    show_duplicate_prefix = true,
    persist_buffer_sort = true,
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    hover = { enabled = false },
  };
  highlights = highlights;
}

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "Gray", { fg = c.bl0 })
end)

require("ibl").setup {indent = {highlight = highlight }}
vim.api.nvim_set_hl(0, "TelescopeBorder", {fg = c.bl0})
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", {bg = c.bg3})
vim.api.nvim_set_hl(0, "CmpMenuBorder", { fg = c.bl0 })
