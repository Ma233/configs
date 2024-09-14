local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", false },
      { "<C-p>", Util.pick("files"), desc = "Find Files (root dir)" },
    },
    opts = {
      defaults = {
        layout_config = {
          horizontal = {
            width = 0.75,
            height = 0.5,
          },
        },
        mappings = {
          i = {
            ["<esc>"] = "close",
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<Up>"] = "preview_scrolling_up",
            ["<Down>"] = "preview_scrolling_down",
            ["<Left>"] = "preview_scrolling_left",
            ["<Right>"] = "preview_scrolling_right",
            -- Allow you to use them like in command line.
            ["<C-u>"] = false,
          },
        },
      },
    },
  },
}
