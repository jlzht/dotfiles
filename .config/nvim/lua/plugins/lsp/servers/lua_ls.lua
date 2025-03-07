return {
  settings = {
    Lua = {
        runtime = {
        version = 'LuaJIT'
      },
      diagnosfasftics = {globals = {'vim'}},
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
}
