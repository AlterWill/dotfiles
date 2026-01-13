return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- 'classic', 'modern', or 'helix'
    preset = "modern", 
    
    -- Delay before showing the popup
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,

    -- Enable/disable built-in plugins
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },

    -- Window styling
    win = {
      no_overlap = true,
      padding = { 1, 2 }, -- [top/bottom, right/left]
      title = true,
      title_pos = "center",
      zindex = 1000,
      -- border = "rounded", -- none, single, double, shadow, rounded
    },

    layout = {
      width = { min = 20 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
    },

    -- Sorting: how the keys are displayed
    sort = { "local", "order", "group", "alphanum", "mod" },

    -- Mappings configuration
    spec = {
      {
        mode = { "n", "v" }, -- Normal and Visual mode
        { "<leader>b", group = "Buffers", icon = "" },
        { "<leader>c", group = "Code", icon = "" },
        { "<leader>f", group = "Find", icon = "" },
        { "<leader>g", group = "Go To / LSP", icon = "" },
        { "<leader>q", group = "Quit/Session", icon = "" },
        { "<leader>s", group = "Search", icon = "" },
        { "<leader>w", group = "Write/Save", icon = "" },
        { "<leader>x", group = "Diagnostics", icon = "" },
        
        -- Search Keymaps (Crucial for finding keys)
        { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search Keymaps", icon = "" },
      },
    },

    -- Icons setup
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
