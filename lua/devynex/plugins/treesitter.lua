return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "TSUpdate", "TSInstall", "TSUninstall", "TSLog" },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      auto_install = true,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPre", "BufNewFile" },
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    multiwindow = false, -- Enable multiwindow support.
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = { "BufReadPre", "BufNewFile" },

    opts = {
      move = {
        set_jumps = true, -- whether to set jumps in the jumplist
      },
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@class.outer"] = "<c-v>", -- blockwise
        },
        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true or false
        include_surrounding_whitespace = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter-textobjects").setup(opts)

      --select
      vim.keymap.set({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end, { desc = "Select around function (outer)" })

      vim.keymap.set({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end, { desc = "Select inside function (inner)" })

      vim.keymap.set({ "x", "o" }, "ac", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end, { desc = "Select around class (outer)" })

      vim.keymap.set({ "x", "o" }, "ic", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end, { desc = "Select inside class (inner)" })

      vim.keymap.set({ "x", "o" }, "as", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
      end, { desc = "Select around local scope" })

      vim.keymap.set({ "x", "o" }, "a=", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@assignment.outer", "textobjects")
      end, { desc = "Select around assignment (outer)" })

      vim.keymap.set({ "x", "o" }, "i=", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@assignment.inner", "textobjects")
      end, { desc = "Select inside assignment (inner)" })

      -- swap
      vim.keymap.set("n", "<leader>a", function()
        require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
      end, { desc = "Swap next parameter" })

      vim.keymap.set("n", "<leader>A", function()
        require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
      end, { desc = "Swap previous parameter" })

      -- move
      vim.keymap.set({ "n", "x", "o" }, "[a", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
      end, { desc = "Go to previous start of parameter (inner)" })

      vim.keymap.set({ "n", "x", "o" }, "]A", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@parameter.outer", "textobjects")
      end, { desc = "Go to next end of parameter (outer)" })

      vim.keymap.set({ "n", "x", "o" }, "[A", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.outer", "textobjects")
      end, { desc = "Go to previous end of parameter (outer)" })

      vim.keymap.set({ "n", "x", "o" }, "]a", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
      end, { desc = "Go to next start of parameter (inner)" })

      vim.keymap.set({ "n", "x", "o" }, "]f", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
      end, { desc = "Go to next start of function (inner)" })

      vim.keymap.set({ "n", "x", "o" }, "[f", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
      end, { desc = "Go to previous start of function (inner)" })

      vim.keymap.set({ "n", "x", "o" }, "[F", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@function.inner", "textobjects")
      end, { desc = "Go to previous end of function (outer)" })

      vim.keymap.set({ "n", "x", "o" }, "]F", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@function.inner", "textobjects")
      end, { desc = "Go to next end of function (outer)" })

      vim.keymap.set({ "n", "x", "o" }, "[c", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@class.inner", "textobjects")
      end, { desc = "Go to previous start of class (inner)" })

      vim.keymap.set({ "n", "x", "o" }, "]c", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@class.inner", "textobjects")
      end, { desc = "Go to next start of class (inner)" })

      vim.keymap.set({ "n", "x", "o" }, "]C", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
      end, { desc = "Go to next end of class (outer)" })

      vim.keymap.set({ "n", "x", "o" }, "[C", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
      end, { desc = "Go to previous end of class (outer)" })

      vim.keymap.set({ "n", "x", "o" }, "[S", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@local.scope", "locals")
      end, { desc = "Go to previous start of local scope" })

      vim.keymap.set({ "n", "x", "o" }, "]S", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
      end, { desc = "Go to next start of local scope" })

      vim.keymap.set({ "n", "x", "o" }, "[z", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@fold", "folds")
      end, { desc = "Go to previous start of fold" })

      vim.keymap.set({ "n", "x", "o" }, "]z", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
      end, { desc = "Go to next start of fold" })

      vim.keymap.set({ "n", "x", "o" }, "[(", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@call.inner", "textobjects")
      end, { desc = "Go to previous start of function call (inner)" })

      vim.keymap.set({ "n", "x", "o" }, "](", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@call.inner", "textobjects")
      end, { desc = "Go to next end of function call (inner)" })

      vim.keymap.set({ "n", "x", "o" }, "[=", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@assignment.lhs", "textobjects")
      end, { desc = "Go to previous start of assignment (lhs)" })

      vim.keymap.set({ "n", "x", "o" }, "]=", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@assignment.rhs", "textobjects")
      end, { desc = "Go to next start of assignment (rhs)" })

      -- change
      -- TODO: figure out chaning next param, prev param, next func, prev func etc

      -- Uncomment to enable
      -- vim.keymap.set({ "n", "x", "o" }, "]o", function()
      --   require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
      -- end, { desc = "Go to next start of loop (inner or outer)" })

      -- vim.keymap.set({ "n", "x", "o" }, "]d", function()
      --   require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
      -- end, { desc = "Go to next conditional (outer), start or end whichever is closer" })

      -- vim.keymap.set({ "n", "x", "o" }, "[d", function()
      --   require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
      -- end, { desc = "Go to previous conditional (outer), start or end whichever is closer" })
    end,
  },
}
