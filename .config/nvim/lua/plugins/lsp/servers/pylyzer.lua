return {
	settings = {
    cmd = { "pylyzer", "--server" },
    filetypes = { "python" },
    root_dir = require("lspconfig.util").root_pattern("requirements.txt")
    python = {
      checkOnType = false,
      diagnostics = true,
      inlayHints = true,
      smartCompletion = true
    },
    single_file_support = true
	}
}
