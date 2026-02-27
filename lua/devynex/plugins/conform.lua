return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  dependencies = {
    {
      "mason-org/mason.nvim",
      cmd = "Mason",
      build = ":MasonUpdate",
      keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
      opts = {},
    },

    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = {
        -- To fix auto-fixable lint errors.
        "ruff_fix",
        -- To run the Ruff formatter.
        "ruff_format",
        -- To organize the imports.
        "ruff_organize_imports",
      },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { "rustfmt", lsp_format = "fallback" },
      -- Conform will run the first available formatter
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
  config = function(_, opts)
    local formatters = {
      "stylua",
      "ruff",
      -- TODO: rustfmt is deprecated and should be installed with rustup
      "rustfmt",
      "prettier",
    }

    require("mason-tool-installer").setup({ ensure_installed = formatters })

    -- this is a flag that will be implemented to enable auto formatting toggled
    -- if vim.g.custom_autoformat == true then
    local opts_extends = {
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    }
    -- end

    opts = vim.tbl_deep_extend("force", opts, opts_extends)

    require("conform").setup(opts)
  end,
}
