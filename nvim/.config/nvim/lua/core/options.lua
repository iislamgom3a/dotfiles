vim.o.wrap = false
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.tabwidth = 4
vim.o.expandtab = true
vim.o.swapfile = false
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.o.writebackup = false
vim.o.scrolloff = 15
vim.o.colorcolumn = "100"
vim.o.signcolumn = "yes"
vim.autoindent = true
vim.o.winborder = "rounded"
vim.o.cursorline = false

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.conceallevel = 0
		vim.opt_local.concealcursor = ""
	end,
})
