return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- Initialize buffer variable
      vim.b.completion = vim.b.completion == nil and true or vim.b.completion

      -- Create toggle using Snacks
      Snacks.toggle({
        name = "Completion",
        get = function() return vim.b.completion end,
        set = function(state) vim.b.completion = state end,
      }):map("<leader>uk")

      -- Dynamically enable/disable based on buffer variable and filetype
      opts.enabled = function()
        if vim.bo.filetype == "markdown" then
          return false
        end
        return vim.b.completion ~= false
      end

      return opts
    end,
  },
}   
