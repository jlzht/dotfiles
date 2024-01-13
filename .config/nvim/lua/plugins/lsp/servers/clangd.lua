return {
  settings = {
    cmd = {"clangd",
    "--background-index",
    "--clang-tidy",
    },
    filetypes = {"c", "cpp"},
    root_dir = lspconfig.util.root_pattern("compile_commands.json" , ".git" )
  },
}
