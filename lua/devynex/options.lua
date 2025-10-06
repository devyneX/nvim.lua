vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a"

-- use same clipboard as os
-- scheduled to decrease startup time
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- more convenient search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- indentation
vim.o.expandtab = true -- use space instead of \t
vim.o.tabstop = 2 -- spaces per tab
vim.o.shiftwidth = 2 -- spaces per tab
vim.o.shiftround = true -- round indent to nearest shiftwidth
vim.o.smartindent = true -- smart autoindent
vim.o.list = true -- tab/spaces visual display

-- vim.o.fillchars = {
--   foldopen = "",
--   foldclose = "",
--   fold = " ",
--   foldsep = " ",
--   diff = "╱",
--   eob = " ",
-- }

-- folding
function _G.MyFoldText()
  local line = vim.fn.getline(vim.v.foldstart)
  local count = vim.v.foldend - vim.v.foldstart + 1
  return string.format("%d:%d - %d lines folded - %s", vim.v.foldstart, vim.v.foldend, count, line)
end
vim.o.foldtext = "v:lua.MyFoldText()"

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

vim.o.scrolloff = 10 -- keep 10 lines above and below cursor

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
