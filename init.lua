vim.g.mapleader = ","
vim.g.maplocalleader = ' ' -- local leader is <space>

-- needed this for case insensitive autocomp for vim commands
vim.g.ignorecase = true

vim.opt.clipboard = { 'unnamedplus' }
vim.opt.signcolumn = 'yes:2'
vim.opt.mouse = {}
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.showtabline = 0
vim.opt.wrap = false

vim.opt.wildignorecase = true -- ignore case when completing file names and directories
vim.opt.smartcase = true
vim.opt.wrapscan = true -- searches wrap around the end of the file
vim.opt.scrolloff = 9
vim.opt.sidescrolloff = 10
vim.opt.sidescroll = 1
vim.opt.paste = false
vim.opt.backspace = 'indent,eol,start'
vim.opt.history = 10000
vim.opt.showcmd = true
vim.opt.scrollback = 100000
vim.opt.wildmenu = true
vim.opt.autowriteall = true

vim.opt.cursorline = true
vim.opt.lazyredraw = true

-- set the behavior of tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.hidden = true

vim.opt.autoindent = true
vim.opt.fileencoding = 'utf-8'
vim.opt.encoding = 'utf-8'

-- timings
vim.opt.updatetime = 300
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 10

vim.opt.listchars = {space = '_', tab = '>~', nbsp = '¬', eol = '¶', extends = '»', precedes = '«', trail = '•'}
vim.opt.hlsearch = true

-- error colors are unreadable by default
vim.cmd [[ hi ErrorMsg ctermbg=black ]]
vim.cmd [[ hi Error ctermbg=black ]]

-- ignore default config and plugins
vim.opt.runtimepath:remove(vim.fn.expand('~/.config/nvim'))
vim.opt.packpath:remove(vim.fn.expand('~/.local/share/nvim/site'))

-- append test directory
local data_path = vim.fn.stdpath('data')
vim.opt.runtimepath:append(vim.fn.expand(data_path))
vim.opt.packpath:append(vim.fn.expand(data_path))

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
  package_root = data_path .. '/pack',
  compile_path = data_path .. '/plugin/packer_compiled.lua'
})

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  if install_plugins then
	  packer.sync()
  end
end)
