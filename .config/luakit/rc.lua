require "lfs"
require "unique_instance"

-- Set the cookie policy and storage location
local soup = require "soup"
soup.cookies_storage = luakit.data_dir .. "/cookies.db"
soup.accept_policy = "always"

-- Load library of useful functions for luakit
local lousy = require "lousy"

lousy.widget.tab.label_format = '{title}'

-- Load users theme
lousy.theme.init(lousy.util.find_config("theme.lua"))
assert(lousy.theme.get(), "failed to load theme")

---------------------
-- luakit settings --
---------------------

local user_settings = {
    window = {
        search_engines = {
            sd = "https://soundcloud.com/search?q=%s",
            iv = "https://vid.puffyan.us/search?q=%s",
            gh = "https://github.com/search?q=%s",
            gg = "https://google.com/search?q=%s",
            dd = "https://duckduckgo.com/html/?q=%s",
            sx = "https://baresearch.org/?q=%s"
        },
        default_search_engine = "dd",
        home_page = "about:blank",
    },
    webview = {
        enable_plugins = false,
        enable_java = false,
        enable_javascript = false,
        javascript_can_access_clipboard = false,
        enable_hyperlink_auditing = false,
        enable_dns_prefetching = false,
        enable_media_stream = false,
        enable_webgl = true,
        enable_offline_web_application_cache = true,
        javascript_can_open_windows_automatically = false,
        media_playback_requires_gesture = true
    }
}

-- this function only updates settings values that are defined in user_settings
local function merge(src, ref)
    for key, value in pairs(ref) do
        if type(value) == "table" and type(src[key]) == "table" then
            for k, v in pairs(value) do
                src[key][k] = v
            end
        else
            src[key] = value
        end
    end
    return src
end

local settings = require "settings"

-- Load users webview class
local webview = require "webview"

settings = merge(settings, user_settings)

-------------------------------
-- chrome page customization --
-------------------------------

local chrome = require "chrome"

require "newtab_chrome"
require "downloads_chrome"

local chrome_pages = {
    bookmarks = require "bookmarks_chrome",
    settings = require "settings_chrome",
    history = require "history_chrome",
    adblock = require "adblock_chrome",
    log = require "log_chrome",
}

local css_pathdir = os.getenv("HOME") .. "/.config/luakit/pages/css/"
local palette_css_file = assert(io.open(css_pathdir .. "palette.css","r"))
local chrome_css_file = assert(io.open(css_pathdir .. "chrome.css","r"))

local palette_css = palette_css_file:read("*a")
local chrome_css = chrome_css_file:read("*a")

chrome.stylesheet =  palette_css .. chrome_css

for name, page in pairs(chrome_pages) do
    local file = assert(io.open(css_pathdir .. name .. ".css","r"))
    local stylesheet = file:read("*a")
    file:close()
    if type(page.stylesheet) == "string" then
        page.stylesheet = stylesheet
    else
        page.html_style = stylesheet
    end
end

webview.add_signal("init", function (view)
    view:add_signal("new-window-decision", function (v, uri, reason)
        local w = window.ancestor(v)
        w:new_tab(uri)
        return true
    end)
end)

-- Load users window class
local window = require "window"

window.add_signal("build", function (w)
    local widgets, l, r = require "lousy.widget", w.sbar.l, w.sbar.r

    -- Left-aligned status bar widgets
    l.layout:pack(widgets.uri())
    l.layout:pack(widgets.hist())
    l.layout:pack(widgets.progress())

    -- Right-aligned status bar widgets
    r.layout:pack(widgets.buf())
    r.layout:pack(chrome_pages.log.widget())
    r.layout:pack(widgets.ssl())
    r.layout:pack(widgets.tabi())
    r.layout:pack(widgets.scroll())
end)

-- Load luakit binds and modes
local modes = require "modes"
local binds = require "binds"

modes.add_binds("normal", {
    { "<Control-y>", "Copy selected text.", function ()
        luakit.selection.clipboard = luakit.selection.primary
    end},
})

-- Add adblock
local adblock = require "adblock"

local webinspector = require "webinspector"

-- Add uzbl-like form filling
local formfiller = require "formfiller"

-- Add proxy support & manager
local proxy = require "proxy"

-- Enable Gopher protocol support
local gopher = require "gopher"

-- Add cache control (clear-data, clear-favicon-db)
local clear_data = require "clear_data"

-- Add quickmarks support & manager
local quickmarks = require "quickmarks"

-- Add session saving/loading support
local session = require "session"

-- Add command to list closed tabs & bind to open closed tabs
local undoclose = require "undoclose"

-- Add command to list tab history items
local tabhistory = require "tabhistory"

-- Add command to list open tabs
local tabmenu = require "tabmenu"

-- Add greasemonkey-like javascript userscript support
local userscripts = require "userscripts"

-- Add bookmarks support
local bookmarks = require "bookmarks"

----------------------------
-- download customization --
----------------------------

local downloads = require "downloads"

downloads.default_dir = os.getenv("HOME") .. "/download"

downloads.add_signal("download-location", function (uri, file, mime)
    local dir = ""
    if mime == "application/pdf" then
        dir = os.getenv("HOME") .. "/document/"
    elseif string.find(mime,"image") then
        dir = os.getenv("HOME") .. "/document/image/"
    end
    if dir ~= "" then
        local mode = lfs.attributes(dir, "mode")
        if mode == nil then
            assert(lfs.mkdir(dir))
        elseif mode ~= "directory" then
            error("Cannot create directory " .. dir)
        end
        return dir .. file
    end
    if not file or file == "" then
        file = (string.match(uri, "/([^/]+)$")
            or string.match(uri, "^%w+://(.+)")
            or string.gsub(uri, "/", "_")
            or "untitled")
    end
    return downloads.default_dir .. "/" .. file
end)

downloads.add_signal("download::status", function(dl)
    if dl.mime_type == "application/pdf" and dl.status == "finished" then
        downloads.do_open(dl)
    end
end)

downloads.add_signal("open-file", function (file, mime_type)
    if mime_type == "application/pdf" then
        luakit.spawn(string.format("zathura %q", file))
        return true
    end
end)

-- Add vimperator-like link hinting & following
local follow = require "follow"
local select = require "select"

select.label_maker = function (l)
  return l.sort(l.reverse(l.charset("zxcvbnm")))
end

-- Add command history
local cmdhist = require "cmdhist"

-- Add search mode & binds
local search = require "search"

-- Add ordering of new tabs
local taborder = require "taborder"

-- Save web history
local history = require "history"

-- Add command completion
local completion = require "completion"

require "noscript"

local follow_selected = require "follow_selected"
local go_input = require "go_input"
local go_next_prev = require "go_next_prev"
local go_up = require "go_up"

-- Filter Referer HTTP header if page domain does not match Referer domain
-- require_web_module("referer_control_wm")

local error_page = require "error_page"

-- Add userstyles loader
local styles = require "styles"

-- Hide scrollbars on all pages
local hide_scrollbars = require "hide_scrollbars"

-- Add a stylesheet when showing images
local image_css = require "image_css"

-- Add :view-source command
local view_source = require "view_source"

-----------------------------
-- end user script loading --
-----------------------------

local w = (not luakit.nounique) and (session and session.restore())
if w then
    for i, uri in ipairs(uris) do
        w:new_tab(uri, { switch = i == 1 })
    end
else
  -- Or open new window
  window.new(uris)
end

-- vim: et:sw=4:ts=8:sts=4:tw=80
