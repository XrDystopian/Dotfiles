vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4
opt.smartindent = true
opt.mouse = "a"
opt.tabstop = 4

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true
