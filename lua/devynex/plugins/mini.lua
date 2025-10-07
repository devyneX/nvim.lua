return {
  {
    "nvim-mini/mini.pairs",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "nvim-mini/mini.surround",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
    },
  },
  {
    "echasnovski/mini.hipatterns",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      delay = {
        -- How much to wait for update after every text change
        text_change = 200,

        -- How much to wait for update after window scroll
        scroll = 50,
      },
    },
    config = function(_, opts)
      local hipatterns = require("mini.hipatterns")
      local _opts = {
        highlighters = {
          -- Highlight hex color strings (`#rrggbb`) using that color
          -- #654321
          hex_color = hipatterns.gen_highlighter.hex_color(),
          -- TODO: get highlighter for #rgb color strings
          -- TODO: get highlighter for rgba(r, g, b, a) colors
        },
      }
 
      opts = vim.tbl_deep_extend("force", opts, _opts)
      hipatterns.setup(opts)
    end,
  },
}
