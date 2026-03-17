vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.cpp",
	callback = function()
		local template = vim.fn.expand("~/work/cp-solutions/templates/sol.cpp")
		if vim.fn.filereadable(template) == 1 then
			vim.cmd("0r " .. template)
		end
	end,
})

return {}
