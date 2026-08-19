return {
	"mason-org/mason.nvim",
	opts = {
		ensure_installed = {
			"ruff",
			"pyright",

			"bash-language-server",
			"gh-actions-language-server",
			"yaml-language-server",
			"docker-compose-language-service",
			"docker-language-server",
			"dockerfile-language-server",

			"typescript-language-server",
			"html-lsp",
			"css-lsp",

			"clangd",
			"sql-formatter",
			"prettier",
		},
	},
}
