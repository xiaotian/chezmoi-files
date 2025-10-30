vim.lsp.config('ruff', {

  -- Command and arguments to start the server.
  cmd = { 'ruff', 'server' },

  -- Filetypes to automatically attach to.
  filetypes = { 'python' },

  -- Root directory markers
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
})
return {
}
