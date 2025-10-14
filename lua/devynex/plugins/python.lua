return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "folke/snacks.nvim",
    },
    ft = "python", -- Load when opening Python files
    keys = {
      { "cv", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
    },
    opts = { -- this can be an empty lua table - just showing below for clarity.
      search = {}, -- if you add your own searches, they go here.
      options = {}, -- if you add plugin options, they go here.
    },
    -- TODO: doesn't work
    -- specs = {
    --   {
    --     "nvim-lualine/lualine.nvim",
    --     opts = {
    --       sections = {
    --         lualine_x = { "venv-selector" },
    --       },
    --     },
    --   },
    -- },
  },
}
