return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy", -- Disabled to save ~50% memory. Uncomment if needed.
            "--header-insertion=never", -- Avoid indexing overhead for insertions
            "--completion-style=bundled", -- "bundled" uses less memory than "detailed"
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "-j=1", -- Limit background indexing to 1 thread to save RAM and CPU
            "--pch-storage=disk", -- Save memory by writing PCHs to disk
            "--background-index-priority=low", -- Lower background indexing CPU priority
            "--malloc-trim", -- Releases memory back to the OS aggressively (Linux-only, very effective)
            "--limit-results=50", -- Reduce memory by limiting autocomplete items returned
          },
        },
        -- For TypeScript/JavaScript (vtsls is the default in newer LazyVim, tsserver in older)
        vtsls = {
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 1024, -- Limit TS server memory to 1GB (default is 3GB)
              },
            },
            javascript = {
              tsserver = {
                maxTsServerMemory = 1024,
              },
            },
          },
        },
        tsserver = {
          settings = {
            maxTsServerMemory = 1024, -- For older configurations using tsserver directly
          },
        },
      },
    },
  },
}
