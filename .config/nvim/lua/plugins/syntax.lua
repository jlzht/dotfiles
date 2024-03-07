local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
		"c",
		"cpp",
		"zig",
		"rust",
		"bash",
		"lua",
		"python",
		"kotlin",
		"java",
		"bitbake",
		"meson",
		"cmake",
		"kconfig",
	},
	ignore_install = { "" },
	sync_install = false,
	highlight = {
		enable = true,
		disable = { "css" },
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
