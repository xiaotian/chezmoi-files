return {
  "cenk1cenk2/schema-companion.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("schema-companion").setup({
      log_level = vim.log.levels.INFO,
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>ys", function()
      require("schema-companion").select_schema()
    end, { desc = "Select YAML/JSON Schema" })

    vim.keymap.set("n", "<leader>ym", function()
      require("schema-companion").select_matching_schema()
    end, { desc = "Select from Matching Schemas" })

    vim.keymap.set("n", "<leader>yc", function()
      local schemas = require("schema-companion").get_current_schemas()
      if schemas then
        vim.notify("Current schema: " .. schemas, vim.log.levels.INFO)
      else
        vim.notify("No schema selected", vim.log.levels.WARN)
      end
    end, { desc = "Show Current Schema" })

    vim.keymap.set("n", "<leader>yr", function()
      require("schema-companion").match()
      vim.notify("Schema matching retriggered", vim.log.levels.INFO)
    end, { desc = "Retrigger Schema Matching" })
  end,
}
