return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			-- ruff_fix also removes unused imports, unlike ruff_organize_imports
			-- which only sorts them.
			python = { "ruff_fix", "ruff_format" },
		},
		formatters = {
			ruff_fix = {
				append_args = { "--extend-select", "I" },
			},
		},
	},
}
