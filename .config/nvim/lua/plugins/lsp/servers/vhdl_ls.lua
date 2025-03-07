local root_files = {
  'vhdl_ls.toml',
  '.vhdl_ls.toml',
}

return {
	settings = {
		cmd = { "vhdl_ls" },
		filetypes = { "vhd", "vhdl" },
    root_dir = util.root_pattern(unpack(root_files)),
		single_file_support = true,
	},
}
