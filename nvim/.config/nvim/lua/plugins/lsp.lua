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
            "--header-insertion=never",
            "--completion-style=bundled",
            "--fallback-style=llvm",
            "-j=4",
            "--pch-storage=disk",
            "--background-index-priority=low",
            "--malloc-trim",
            "--limit-results=100",
            "--log=error",
            "--compile-commands=/home/alterwill/blender/compile_commands.json",
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
