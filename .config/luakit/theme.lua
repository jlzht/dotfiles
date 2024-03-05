local c = require 'palette'

local theme = {}

-- Default settings
theme.font = "12pt Source Code Pro"
theme.fg = c.wh1
theme.bg = c.bg0

-- Genaral colours
theme.success_fg = c.gr1
theme.loaded_fg = c.bu0
theme.error_fg = c.bg0
theme.error_bg = c.rd1

-- Warning colours
theme.warning_fg = c.bg0
theme.warning_bg = c.yw1

-- Notification colours
theme.notif_fg = c.wh1
theme.notif_bg = c.bl0

-- Menu colours
theme.menu_fg = c.wh1
theme.menu_bg = c.bg0
theme.menu_selected_fg = c.wh1
theme.menu_selected_bg = c.bg3
theme.menu_title_bg = c.bl1
theme.menu_primary_title_fg = c.wh1
theme.menu_secondary_title_fg = c.wh1

theme.menu_disabled_fg = c.fg2
theme.menu_disabled_bg = c.bg1
theme.menu_enabled_fg = c.fg0
theme.menu_enabled_bg = c.bg1
theme.menu_active_fg = c.cy1
theme.menu_active_bg = c.bg1

-- Proxy manager
theme.proxy_active_menu_fg = c.fg1
theme.proxy_active_menu_bg = c.bg1
theme.proxy_inactive_menu_fg = c.wh1
theme.proxy_inactive_menu_bg = c.bg1

-- Statusbar specific
theme.sbar_fg = c.wh1
theme.sbar_bg = c.bl1

-- Downloadbar specific
theme.dbar_fg = c.cy0
theme.dbar_bg = c.bg1
theme.dbar_error_fg = c.rd0

-- Input bar specific
theme.ibar_fg = c.wh1
theme.ibar_bg = c.bl1

-- Tab label
theme.tab_fg = c.wh1
theme.tab_bg = c.bl1
theme.tab_hover_bg = c.bg1
theme.tab_ntheme = c.bl0
theme.selected_fg = c.wh1
theme.selected_bg = c.bg3
theme.selected_ntheme = c.fg1
theme.loading_fg = c.fg0
theme.loading_bg = c.bg0
theme.selected_private_tab_bg = c.bg3
theme.private_tab_bg = c.bg2

-- Trusted/untrusted ssl colours
theme.trust_fg = c.gr0
theme.notrust_fg = c.rd0

-- Follow mode hints
theme.hint_font = "13px Source Code Pro"
theme.hint_fg = c.fg0
theme.hint_bg = c.bg1
theme.hint_border = "0px"
theme.hint_opacity = "0.6"
theme.hint_overlay_bg = c.bg3
theme.hint_overlay_border = "0px"
theme.hint_overlay_selected_bg = c.bu1
theme.hint_overlay_selected_border = theme.hint_overlay_border

-- General colour pairings
theme.ok = { fg = c.gr0, bg = c.bg1 }
theme.warn = { fg = c.yw0, bg = c.bg1 }
theme.error = { fg = c.rd0, bg = c.bg1 }

-- Gopher page style (override defaults)
theme.gopher_light = { bg = c.fg0, fg = c.bg0, link = c.bu1 }
theme.gopher_dark  = { bg = c.bg0, fg = c.fg0, link = c.bu0 }

return theme
