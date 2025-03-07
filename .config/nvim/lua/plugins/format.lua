require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.DEBUG,
	filetype = {
    c = {
      require("formatter.filetypes.c").clangformat,
    },
    cpp = {
      require("formatter.filetypes.c").clangformat
    },
    kotlin = {
			require("formatter.filetypes.kotlin").ktlint,
    },
    python = {
			require("formatter.filetypes.python").ruff,
    },
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.g.zig_fmt_autosave = 0
vim.g.zig_fmt_parse_errors = 0

-- ZLS handles zig fmt
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.zig",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
