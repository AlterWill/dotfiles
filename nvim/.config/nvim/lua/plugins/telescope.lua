return  { 
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>' , builtin.find_files,{ desc = "Find Files" })
      vim.keymap.set('n', '<leader>fg' , builtin.live_grep,{ desc = "Live Grep" })
      vim.keymap.set('n', '<leader>fb' , builtin.buffers,{ desc = "Find Buffers" })
      vim.keymap.set('n', '<leader>fh' , builtin.help_tags,{ desc = "Help Tags" })
      vim.keymap.set('n', '<leader>fo' , builtin.oldfiles,{ desc = "Recent Files" })
      vim.keymap.set('n', '<leader>fw' , builtin.grep_string,{ desc = "Grep Word Under Cursor" })
    end
  },{
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup ({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}

