local c = require('core.themes.palette')

local M = {}
local hl = {langs = {}, plugins = {}}

local function vim_highlights(highlights)
  for group_name, group_settings in pairs(highlights) do
    vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s", group_name,
    group_settings.fg or "none",
    group_settings.bg or "none",
    group_settings.sp or "none",
    group_settings.fmt or "none"))
  end
end

-- See: https://neovim.io/doc/user/syntax.html

hl.common = {
  Normal = {fg = c.wh1},
  Terminal = {fg = c.wh1, bg = transparent and c.none or c.bg0},
  EndOfBuffer = {fg = c.b3 and c.bl1 or c.bg0, bg = c.b3 and c.none or c.bg0},
  FoldColumn = {fg = c.fg, bg = transparent and c.none or c.bg1},
  Folded = {fg = c.fg, bg = c.bg3 and c.none or c.bg1},
  SignColumn = {fg = c.fg, bg = c.bg3 and c.none or c.bg0},
  ToolbarLine = {fg = c.wh1},
  Cursor = {fmt = "reverse"},
  vCursor = Cursor,
  iCursor = Cursor,
  lCursor = Cursor,
  CursorIM = Cursor,
  CursorColumn = {bg = c.bg1},
  CursorLine = {bg = c.bg1},
  ColorColumn = {bg = c.bg1},
  CursorLineNr = {fg = c.wh1},
  LineNr = {fg = c.fg1},
  Conceal = {fg = c.wh1,bg = c.bg1},
  DiffAdd = {fg = c.gr0,bg = c.bg0,fmt = "reverse"},
  DiffDelete = {fg = c.rd0,bg = c.bg0,fmt = "reverse"},
  DiffChange = {fg = c.bu0,bg = c.bg0,fmt = "reverse"},
  DiffText = {fg = c.yw0,bg = c.bg0,fmt = "reverse"},
  DiffAdded = {fg = c.gr0},
  DiffRemoved = {fg = c.rd0},
  DiffFile = {fg = c.cy0},
  DiffIndexLine = {fg = c.wh0},
  Directory = {fg = c.bu1},
  MsgArea = {fg = c.fg2,bg = c.bl1},
  ErrorMsg = {fg = c.rd1,fmt = "bold"},
  WarningMsg = {fg = c.yw1,fmt = "bold"},
  MoreMsg = {fg = c.bu0,fmt = "bold"},
  IncSearch = {fg = c.mg0},
  Search = {fg = c.mg1},
  Substitute = {fg = c.mg0},
  MatchParen = {fmt = "bold"},
  NonText = {fg = c.wh0},
  Whitespace = {fg = c.wh0},
  SpecialKey = {fg = c.wh0},
  Pmenu = {fg = c.fg2,bg = c.bg0},
  PmenuSbar = {fg = c.none,bg = c.bl0},
  PmenuSel = {fg = c.wh1,bg = c.bl1},
  WildMenu = {fg = c.fg1,bg = c.bl0},
  PmenuThumb = {fg = c.none,bg = c.bl1},
  Question = {fg = c.fg1},
  StatusLine = {fg = c.wh1, bg = c.bl1},
  StatusLineTerm = {fg = c.wh1, bg = c.bl1},
  StatusLineNC = {fg = c.wh0, bg = c.bg1},
  StatusLineTermNC = {fg = c.wh0, bg = c.bg1},
  TabLine = {fg = c.wh1,bg = c.bg1},
  TabLineFill = {fg = c.wh0,bg = c.bg1},
  TabLineSel =  {fg = c.bg0,bg = c.wh1},
  VertSplit = {fg = c.bg3},
  Visual = {bg = c.bg3},
  QuickFixLine = {fg = c.bu0,fmt = "underline"},
  Debug = {fg = c.yw0},
  debugPC = {fg = c.bg0,bg = c.gr0},
  debugBreakpoint = {fg = c.bg0,bg = c.rd0},
  ToolbarButton = {fg = c.bg0,bg = c.bu0},
  FloatBorder = {fg = c.wh0,bg = c.bg1},
  NormalFloat = {fg = c.wh1,bg = c.bg1},
}

hl.syntax = {
  Comment = {fg = c.fg2,fmt = "italic"},
  Constant = {fg = c.gr0},
  String = {fg = c.gr0},
  Character = {fg = c.gr0},
  Number = {fg = c.gr0},
  Boolean = {fg = c.bl1},
  Float = {fg = c.gr0},
  Identifier = {fg = c.wh0},
  Function = {fg = c.gr1,fmt="bold"},
  Statement = {fg = c.rd1 ,fmt = "bold"},
  Conditional = {fg = c.rd1,fmt = "bold"},
  Repeat = {fg = c.rd1,fmt = "bold"},
  Label = {fg = c.rd1},
  Operator = {fg = c.cy0,fmt="bold"},
  Keyword = {fg = c.rd1,fmt ="bold"},
  Exception = {fg = c.mg0},
  PreProc = {fg = c.mg1},
  Include = {fg = c.mg0,fmt="bold"},
  Define = {fg = c.mg0, fmt="bold"},
  Macro = {fg = c.cy0},
  PreCondit = {fg = c.mg1},
  Type = {fg = c.bu0,fmt="bold"},
  StorageClass = {fg = c.bu0},
  Structure = {fg = c.bu0},
  Typedef = {fg = c.bu0},
  Special = {fg = c.yw1},
  SpecialChar = {fg = c.yw0},
  Tag = {fg = c.gr0},
  Delimiter = {fg = c.wh0},
  SpecialComment = {fg = c.fg1, fmt = "italic"},
  Debug = {fg = c.bg3},
  Underlined = {fg = c.bu1},
  Error = {fg = c.rd1,bg=c.rd0},
  Todo = {fg = c.wh0,bg = c.cy1,fmt = "bold"},
  Title = {fg = c.cy1},
}

hl.langs.c = {
  cInclude = {fg = c.mg0,fmt="bold"},
  cStorageClass = {fg = c.bu0},
  cTypedef = {fg = c.rd0},
  cDefine = {fg = c.mg0,fmt="bold"},
  cTSInclude = {fg = c.mg0,fmt="bold"},
  cTSConstant = {fg = c.gr0},
  cTSConstMacro = {fg = c.cy0},
  cTSOperator = {fg = c.rd1},
}

hl.langs.cpp = {
    cppStatement = { fg = c.rd1, fmt = "bold" },
    cppTSInclude = {fg = c.mg0,fmt="bold"},
    cppTSConstant = {fg = c.gr0},
    cppTSConstMacro = {fg = c.cy0},
    cppTSOperator =  {fg = c.rd1},
}

function M.setup()
  vim_highlights(hl.common)
  vim_highlights(hl.syntax)
  for _, group in pairs(hl.langs) do vim_highlights(group) end
  for _, group in pairs(hl.plugins) do vim_highlights(group) end
  vim.cmd("highlight id1 guifg=" .. c.gr0 .. " gui=nocombine")
end

return M
