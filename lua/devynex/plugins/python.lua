return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "folke/snacks.nvim",
      "nvim-lualine/lualine.nvim",
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
    config = function(_, opts)
      require("venv-selector").setup(opts)
      local lualine = require("lualine")
      local lualine_conf = lualine.get_config()
      lualine_conf.sections.lualine_x =
        vim.tbl_deep_extend("force", lualine_conf.sections.lualine_x, { "venv-selector" })
      lualine.setup(lualine_conf)
    end,
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
