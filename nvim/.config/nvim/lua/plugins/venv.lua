-- Plugin configuration for venv-selector.nvim
return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},
	-- Load when opening Python files
	ft = "python",
	keys = {
		{ ",v", "<cmd>VenvSelect<>" },
	},
	opts = {
		search = {
			anaconda_base = {
				command = "fd /python$ /home/iislamgom3a/anaconda3/bin/ --full-path --color never -E /proc",
				type = "anaconda",
			},
		},
	},
}
