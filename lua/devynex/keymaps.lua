-- jj to exit insert
vim.keymap.set("i", "jj", "<esc>", { desc = "Switch to Normal Mode" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open File Explorer" })

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format()
end, { desc = "Format" })

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below" })
vim.keymap.set("n", "<leader>wh", "<C-W>s", { desc = "Split Window Below" })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right" })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split Window Right" })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window" })
vim.keymap.set("n", "<leader>ww", "<C-W>w", { desc = "Switch Window" })

-- buffers
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })

-- escape to noh
vim.keymap.set({ "n", "s", "i" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true })

-- lazy
vim.keymap.set("n", "<leader>l", function()
  vim.cmd("Lazy")
end, { desc = "Lazy" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

vim.keymap.set("n", "[^", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- First line, first column
vim.keymap.set({ "n", "v" }, "gg", "gg0", { desc = "jump to the start first line" })

-- Last line, last character
vim.keymap.set({ "n", "v" }, "G", "G$", { desc = "Jump to the end of the last line" })

vim.keymap.set("n", "<leader>sf", function()
  vim.ui.input({ prompt = "Glob pattern (e.g. *.js): " }, function(glob)
    if not glob or glob == "" then
      return
    end

    Snacks.picker.grep({
      glob = glob,
    })
  end)
end, { desc = "Search (Glob)" })
