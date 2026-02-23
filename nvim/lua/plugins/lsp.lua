return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bufls = {},
      },
      ["*"] = {
        keys = {
          { "<leader>rn", vim.lsp.buf.rename, desc = "Code Rename" },
        },
      },
    },
  },
}
