return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				html = {
					settings = {
						html = {
							format = {
								tabSize = 4,
								insertSpaces = true,
							},
						},
					},
				},
				pyright = {
					settings = {
						pyright = {
							disableOrganizeImports = true,
						},
					},
				},
			},
		},
	},
}
