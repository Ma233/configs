return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.rust_analyzer.settings["rust-analyzer"] = {
        cargo = {
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
          -- features = { "browser_chrome_test" },
          -- features = { "browser" },
          -- features = { "dummy" },
        },
        rustfmt = {
          extraArgs = { "+nightly" },
        },
        checkOnSave = {
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        procMacro = {
          enable = true,
        },
      }
      return opts
    end,
  },
}
