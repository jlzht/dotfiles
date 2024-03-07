return {
	settings = {
		cmd = { "bash-language-server", "start" },
		filetypes = { "sh" },
		root_dir = util.find_git_ancestor,
		single_file_support = true,
	},
}
