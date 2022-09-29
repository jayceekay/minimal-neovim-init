vim.g.mapleader = ','
vim.g.maplocalleader = ' '

vim.g.ignorecase = true

vim.opt.clipboard = {'unnamedplus'}
vim.opt.signcolumn = 'yes:2'
vim.opt.mouse = {}
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.showtabline = 0
vim.opt.wrap = false

vim.opt.wildignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
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

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.hidden = true

vim.opt.autoindent = true
vim.opt.fileencoding = 'utf-8'
vim.opt.encoding = 'utf-8'

vim.opt.updatetime = 300
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 10

vim.opt.listchars = {space = '_', tab = '>~', nbsp = '¬', eol = '¶', extends = '»', precedes = '«', trail = '•'}
vim.opt.hlsearch = true

vim.cmd [[ hi ErrorMsg ctermbg=black ]]
vim.cmd [[ hi Error ctermbg=black ]]

vim.opt.runtimepath:remove(vim.fn.expand('~/.config/nvim'))
vim.opt.packpath:remove(vim.fn.expand('~/.local/share/nvim/site'))

local data_path = vim.fn.stdpath('data')
vim.opt.runtimepath:append(vim.fn.expand(data_path))
vim.opt.packpath:append(vim.fn.expand(data_path))

local install_path = vim.fn.stdpath('data') .. '/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

local packer = require('packer')

packer.init({package_root = data_path .. '/pack', compile_path = data_path .. '/plugin/packer_compiled.lua'})

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup {

        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = '3',
        start_in_insert = false,
        insert_mappings = true,
        persist_size = true,
        direction = 'horizontal',
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = 'curved',
          go_back = 0,
          width = 100,
          height = 30,
          winblend = 3,
          highlights = {border = 'Normal', background = 'Normal'}
        }
      }
    end
  }

  if install_plugins then packer.sync() end
end)
