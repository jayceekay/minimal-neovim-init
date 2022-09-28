-- ignore default config and plugins
vim.opt.runtimepath:remove(vim.fn.expand('~/.config/nvim'))
vim.opt.packpath:remove(vim.fn.expand('~/.local/share/nvim/site'))

-- error colors are unreadable by default
vim.cmd [[ hi ErrorMsg ctermbg=black ]]
vim.cmd [[ hi Error ctermbg=black ]]

-- append test directory
local test_dir = vim.fn.stdpath('data')
vim.opt.runtimepath:append(vim.fn.expand(test_dir))
vim.opt.packpath:append(vim.fn.expand(test_dir))

-- install packer
-- local install_path = test_dir .. '/pack/packer/start/packer.nvim'
local install_path = vim.fn.stdpath('data') .. '/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

local packer = require('packer')

packer.init({
  package_root = test_dir .. '/pack',
  compile_path = test_dir .. '/plugin/packer_compiled.lua'
})

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  if install_plugins then
	  packer.sync()
  end
end)
