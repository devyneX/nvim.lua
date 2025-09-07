-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<esc>", { desc = "Switch to Normal Mode" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open File Explorer" })

vim.keymap.set("n", "[^", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- First line, first column
vim.keymap.set({ 'n', 'v' }, 'gg', 'gg0', { desc = "jump to the start first line" })

-- Last line, last character
vim.keymap.set({ 'n', 'v' }, 'G', 'G$', { desc = "Jump to the end of the last line" })

vim.keymap.set("n", "<leader>sf", function()
  vim.ui.input({ prompt = "Glob pattern (e.g. *.js): " }, function(glob)
    if not glob or glob == "" then return end

    require("telescope.builtin").live_grep({
      glob_pattern = glob,
      prompt_title = "Live Grep in " .. glob,
      default_text = ""
    })
  end)
end, { desc = "Live grep with glob filter" })

-- TODO: need to figure this out
-- vim.keymap.set("n", "<leader>.", function()
--   local snacks = require("lazy/snacks.nvim")
--   snacks.opts.picker.files.hidden = true
--   snacks.opts.explorer.files.hidden = true
-- end, { desc = "Toggle hidden files in explorer" })
