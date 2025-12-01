return{
  "stevearc/conform.nvim",
  event = "BufWritePre", -- Format before writing the buffer
  config = function()
	require("conform").setup({
	  formatters_by_ft = {
		python = { "black" }, -- Or "ruff_format" if you prefer Ruff
	  },
	  format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	  },
	})
  end,
}
