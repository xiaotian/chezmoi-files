-- this file is not used, keep it here for refernece purpose.
-- rust-analyzer lsp is managed by rustaceanvim plugin
return {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rs' },
  root_markers = { 'Cargo.toml', 'Cargo.lock' },
}
