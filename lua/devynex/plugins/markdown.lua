return {
  {
    "iamcco/markdown-preview.nvim",
    -- TODO: add keymaps
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    keys = {
      { "<leader>m", "<cmd>MarkdownPreviewToggle<cr>", mode = { "n" }, desc = "Markdown Preview" },
    },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
