local cmp = require("cmp")

local luasnip = require("luasnip")

require('luasnip.loaders.from_vscode').lazy_load()

local function border(hl_name)
  return {
    { "┌", hl_name },
    { "─", hl_name },
    { "┐", hl_name },
    { "│", hl_name },
    { "┘", hl_name },
    { "─", hl_name },
    { "└", hl_name },
    { "│", hl_name },
  }
end

cmp.setup({
  window = {
    completion = {
      border = border("CmpMenuBorder"),
      scrollbar = false
    },
    documentation = {
      border = border("CmpMenuBorder"),
      winhighlight = "Normal:CmpDoc",
    },
  },
  formatting = {
      fields = { "abbr", "menu", "kind" },
      format = function(entry, item)
        local menu_icon = {
            nvim_lsp = "NLSP",
            luasnip  = "LSNP",
            buffer   = "BUFF",
            path     = "PATH",
        }
        item.menu = menu_icon[entry.source.name]
        local content = item.abbr
        local win_width = vim.api.nvim_win_get_width(0)
        local max_content_width = math.floor(win_width * 0.2)
        if #content > max_content_width then
            item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
        else
            item.abbr = content .. (" "):rep(max_content_width - #content)
        end
        return item
      end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = cmp.mapping.select_prev_item(),
    ['<C-k>'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end),
  }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp'},
    { name = 'luasnip'},
    { name = 'buffer'},
    { name = 'path'},
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})
