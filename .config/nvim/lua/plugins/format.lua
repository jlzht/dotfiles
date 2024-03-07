require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
    c = {
      require("formatter.filetypes.c").clangformat,
    },
    sh = {
			require("formatter.filetypes.sh").shfmt,
    },
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
