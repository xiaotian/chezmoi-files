return {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--header-insertion=iwyu',
    '--completion-style=detailed',
    '--function-arg-placeholders',
    '--fallback-style=llvm',
    '--pch-storage=memory',
    '--log=error',
  },

  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto', 'arduino' },

  root_markers = {
    'compile_commands.json',
    'compile_flags.txt',
    '.clangd',
    '.git',
    'Makefile',
    'CMakeLists.txt',
  },

  capabilities = {
    offsetEncoding = { 'utf-16' },
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
          resolveSupport = {
            properties = { 'documentation', 'detail', 'additionalTextEdits' }
          }
        }
      }
    }
  },

  -- Optional: clangd-specific settings
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },

  -- Optional: commands specific to clangd
  commands = {
    ClangdSwitchSourceHeader = {
      function()
        vim.lsp.buf.execute_command({
          command = 'clangd.switchheader',
          arguments = { vim.uri_from_bufnr(0) },
        })
      end,
      description = 'Switch between source/header'
    }
  }
}
