return {
  {
    "nvim-mini/mini.pairs",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {}
  },
  {
    "nvim-mini/mini.surround",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsF", -- Find surrounding (to the right)
        find_left = "gsf", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
    },
  },
}
