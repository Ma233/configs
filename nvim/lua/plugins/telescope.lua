return {
  {
    "nvim-telescope/telescope.nvim",
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
