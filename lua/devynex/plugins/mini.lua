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
          -- Full hex - #ffaa33
          hex_color = hipatterns.gen_highlighter.hex_color(),

          -- hex with alpha (alpha is ignored) - #ffaa33aa -> #ffaa33
          hex_color_alpha = {
            pattern = "%f[#]#%x%x%x%x%x%x%x%x%f[%W]",
            group = function(_, match)
              local r = match:sub(2, 3)
              local g = match:sub(4, 5)
              local b = match:sub(6, 7)
              local hex = "#" .. r .. g .. b
              return hipatterns.compute_hex_color_group(hex, "bg")
            end,
          },

          -- Short hex #aaf -> #aaaaff
          short_hex = {
            pattern = "%f[#]#%x%x%x%f[%W]",
            group = function(_, match)
              local r = string.rep(match:sub(2, 2), 2)
              local g = string.rep(match:sub(3, 3), 2)
              local b = string.rep(match:sub(4, 4), 2)
              local hex = "#" .. r .. g .. b
              return hipatterns.compute_hex_color_group(hex, "bg")
            end,
          },

          -- rgb(r, g, b) - rgb(123, 123, 123)
          rgb = {
            pattern = "rgb%s*%(%s*%d%d?%d?%s*,%s*%d%d?%d?%s*,%s*%d%d?%d?%s*%)",
            group = function(_, match)
              local r, g, b = match:match("(%d+)%s*,%s*(%d+)%s*,%s*(%d+)")
              local hex = string.format("#%02x%02x%02x", r, g, b)
              return hipatterns.compute_hex_color_group(hex, "bg")
            end,
          },

          -- RGBA colors (alpha ignored) - rgba(123, 123, 123, 0.5) - rgb(123, 123, 123)
          rgba = {
            pattern = "rgba%s*%(%s*%d%d?%d?%s*,%s*%d%d?%d?%s*,%s*%d%d?%d?%s*,%s*%d?%.?%d+%s*%)",
            group = function(_, match)
              local r, g, b = match:match("(%d+)%s*,%s*(%d+)%s*,%s*(%d+)")
              local hex = string.format("#%02x%02x%02x", r, g, b)
              return hipatterns.compute_hex_color_group(hex, "bg")
            end,
          },
        },
      }

      opts = vim.tbl_deep_extend("force", _opts, opts or {})
      hipatterns.setup(opts)
    end,
  },
}
