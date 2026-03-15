-- lua/plugins/python-run.lua
--
vim.keymap.set("n", "<leader>rp", function()
	local file = vim.fn.expand("%:p")

	if file == "" then
		print("No file to run")
		return
	end

	vim.cmd("write")

	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	vim.fn.termopen({ "python3", file })
end, { desc = "Run current Python file (float)" })

return {}
