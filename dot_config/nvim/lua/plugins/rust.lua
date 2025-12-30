return {
  'mrcjkb/rustaceanvim',
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  version = '^6', -- Recommended
  lazy = false,   -- This plugin is already lazy
  ft = { 'rust' },
  ["rust-analyzer"] = {
    cargo = {
      allFeatures = true,
    }
  },
  config = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.keymap.set(
      "n",
      "<leader>a",
      function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
      end,
      { silent = true, buffer = bufnr }
    )
    vim.keymap.set(
      "n",
      "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
      function()
        vim.cmd.RustLsp({ 'hover', 'actions' })
      end,
      { silent = true, buffer = bufnr }
    )
    vim.keymap.set("n", "<leader>dr", function()
      if vim.bo.modified then
        vim.cmd('write')
      end
      vim.cmd('RustLsp debug {args[]}?')
    end, { desc = 'Rust debuggables' })

    vim.keymap.set("n", "<leader>rl", function()
      if vim.bo.modified then
        vim.cmd('write')
      end
      vim.cmd.RustLsp({'runnables', bang=true})
    end, { desc = 'Run Last Rust Target' })

    vim.keymap.set("n", "<leader>rt", function()
      if vim.bo.modified then
        vim.cmd('write')
      end
      vim.cmd.RustLsp('runnables')
    end, { desc = 'Select target to run' })
  end
}
