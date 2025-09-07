-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- python setup
vim.g.python3_host_prog = "/home/luffy/Documents/Dev/.uv-venv/nvim-python/bin/python"

-- nodejs
vim.g.node_host_prog = "/home/luffy/.config/nvm/versions/node/v24.5.0/bin/node"

-- terminal
vim.g.terminal_emulator = "kitty"
vim.o.shell = "/usr/bin/zsh"

vim.o.exrc = true -- Allow per-project config like `.nvim.lua`
vim.o.secure = true -- Prevent unsafe commands
