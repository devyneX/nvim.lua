return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "folke/snacks.nvim",
    },
    ft = "python", -- Load when opening Python files
    keys = {
      -- TODO: doesn't show up in which-key
      { "cv", "<cmd>VenvSelect<cr>", desc = "Change venv" },
    },
    opts = { -- this can be an empty lua table - just showing below for clarity.
      search = {}, -- if you add your own searches, they go here.
      options = {}, -- if you add plugin options, they go here.
    },
    specs = {
      {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
          opts.sections.lualine_x = vim.tbl_deep_extend("force", opts.sections.lualine_x, { "venv-selector" })
          return opts
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    specs = {
      {
        "mfussenegger/nvim-dap",
        dependencies = {
          "mfussenegger/nvim-dap-python",
        },
      },
    },
    config = function()
      require("dap-python").setup("uv")
    end,
  },
}
