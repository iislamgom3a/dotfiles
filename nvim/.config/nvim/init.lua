-- load core options
require 'core.options'
require 'core.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- load plugins
require('lazy').setup({
	require ('plugins.gitsigns'),
	require ('plugins.colortheme'),
	require ('plugins.neotree'),
	require ('plugins.treesitter'),
	require ('plugins.lsp'),
	require ('plugins.autocompletion'),
	require ('plugins.telescope'),
	require ('plugins.alpha'),
	require ('plugins.lualine'),
	require ('plugins.bufferline'),
	require ('plugins.vim-tmux-navigator')
})
