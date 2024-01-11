local servers = {
  "clangd",
}

local settings = {
  ui = {
    border = "none"
  },
  log_level = vim.log.levels.INFO
}

require("mason").setup(settings)

require("mason-lspconfig").setup({
  ensure_installed = servers,
})

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
end 

local function on_attach(client, bufnr)
  lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

for _, server in pairs(servers) do
  opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  server = vim.split(server, "@")[1]
  local success, sv_conf = pcall(require, "plugins.sv" .. server)
  if success then
    opts = vim.tbl_deep_extend("force", sv_conf, opts)
  end
  lspconfig[server].setup(opts)
end
