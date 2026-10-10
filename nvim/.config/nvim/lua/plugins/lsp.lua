return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index", -- Automatically indexes all project files in the background
            "--pch-storage=disk", -- Reduces RAM usage by storing precompiled headers on disk
            "--malloc-trim", -- Aggressively releases memory back to OS (Linux-only)
            "--header-insertion=never", -- Prevents unwanted/slow automatic include insertions
            "--completion-style=bundled", -- Fast, lightweight completion items
            "--function-arg-placeholders", -- Adds parameter placeholders on function autocompletion
            "--fallback-style=llvm", -- Default formatting style fallback
            "--limit-results=50", -- Caps completion results to avoid LSP stutter
          },
        },
        -- TypeScript / JavaScript LSP settings
        vtsls = {
          settings = {
            typescript = {
              tsserver = { maxTsServerMemory = 1024 },
            },
            javascript = {
              tsserver = { maxTsServerMemory = 1024 },
            },
          },
        },
        tsserver = {
          settings = {
            maxTsServerMemory = 1024,
          },
        },
      },
    },
  },
}
