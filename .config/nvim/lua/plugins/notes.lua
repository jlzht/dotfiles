local mp = vim.g

vim.cmd[[
function OpenMarkdownPreview (url)
  execute "silent ! luakit -nU --name=preview --uri=" . a:url
endfunction
]]

mp.mkdp_auto_start = 0
mp.mkdp_auto_close = 1
mp.mkdp_refresh_slow = 0
mp.mkdp_command_for_global = 0
mp.mkdp_open_to_the_world = 0
mp.mkdp_port = '8000'
mp.mkdp_echo_preview_url = 0
mp.mkdp_browserfunc = 'OpenMarkdownPreview'
mp.mkdp_preview_options = {
  mkit = {},
  katex = {},
  uml = {},
  maid = {},
  disable_sync_scroll = 0,
  sync_scroll_type = 'middle',
  hide_yaml_meta = 1,
  sequence_diagrams = {},
  flowchart_diagrams = {},
  content_editable = false,
  disable_filename = 0,
  toc = {}
}
mp.mkdp_markdown_css = ''
mp.mkdp_highlight_css = ''
mp.mkdp_page_title = '${name}'
mp.mkdp_images_path = os.getenv("HOME") .. "/document/image/"
mp.mkdp_filetypes = {'markdown'}
mp.mkdp_theme = 'dark'
mp.mkdp_combine_preview = 0
mp.mkdp_combine_preview_auto_refresh = 1

require('telekasten').setup({
  home = vim.fn.expand("~/document/note"),
})
