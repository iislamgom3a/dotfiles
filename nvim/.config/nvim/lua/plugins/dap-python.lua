-- Python debugging.
-- The adapter runs from a dedicated debugpy venv so project venvs stay clean;
-- the debuggee still uses the project interpreter (VIRTUAL_ENV, CONDA_PREFIX,
-- .venv, or the venv-selector choice below).
return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("dap-python").resolve_python = function()
			local ok, python = pcall(function()
				return require("venv-selector").python()
			end)
			return (ok and python) or vim.fn.exepath("python3")
		end
		require("dap-python").setup("~/.venvs/debugpy/bin/python")
	end,
}
