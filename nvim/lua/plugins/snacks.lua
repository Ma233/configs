return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        layout = {
          preset = "telescope",
          layout = {
            width = 0.75,
            height = 0.5,
          },
        },
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "i", "n" } },
              ["<Up>"] = { "preview_scroll_up", mode = { "i", "n" } },
              ["<Down>"] = { "preview_scroll_down", mode = { "i", "n" } },
              ["<Left>"] = { "preview_scroll_left", mode = { "i", "n" } },
              ["<Right>"] = { "preview_scroll_right", mode = { "i", "n" } },
              -- Allow this key to behave as it does on the command line.
              ["<C-u>"] = { "<C-u>", mode = "i", expr = true, desc = "Delete to start of line" },
            },
          },
          preview = {
            wo = { wrap = false },
          },
        },
      },
    },
  },
}
