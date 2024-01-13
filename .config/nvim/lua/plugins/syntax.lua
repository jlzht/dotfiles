local configs = require "nvim-treesitter.configs"

configs.setup {
  ensure_installed = { "c", "cpp", "bash", "lua", "python" },
  ignore_install = { "" },
  sync_install = false,
  highlight = {
    enable = true,
    disable = { "css" },
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "python"} },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
