return {
  {
    "m4xshen/hardtime.nvim",
    event = "BufRead",
    cmd = { "Hardtime" },
    keys = {
      { "<leader>hr", "<cmd>Hardtime report<cr>", mode = "n", desc = "Hardtime" },
    },
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
}
