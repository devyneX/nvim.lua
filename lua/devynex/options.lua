vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a"

vim.o.showmode = false -- already in statusline

-- use same clipboard as os
-- scheduled to decrease startup time
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- more convenient search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

vim.o.expandtab = true -- use space instead of \t

vim.o.list = true -- tab/spaces visual display

vim.o.signcolumn = "yes"

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- highlight line on which the cursor is
vim.o.cursorline = true

-- undo
vim.o.undofile = true
vim.o.undolevels = 10000

-- confirm
vim.o.confirm = true

-- python
vim.g.python3_host_prog = "/home/luffy/Documents/Dev/.uv-venv/nvim-python/bin/python"

-- nodejs
vim.g.node_host_prog = "/home/luffy/.config/nvm/versions/node/v24.5.0/bin/node"

-- terminal
-- vim.o.term = "kitty"
vim.o.shell = "/usr/bin/zsh"

-- bufferline needs this
vim.o.termguicolors = true

vim.o.exrc = true -- Allow per-project config like `.nvim.lua`
vim.o.secure = true -- Prevent unsafe commands
