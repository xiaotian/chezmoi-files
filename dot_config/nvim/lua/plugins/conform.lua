return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { lsp_format = "prefer" },
        yaml = { lsp_format = "prefer" },
        json = { lsp_format = "prefer" },
        toml = { lsp_format = "prefer" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },

        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },

        -- Conform will run the first available formatter
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        less = { "prettier" },
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    })
  end
}
