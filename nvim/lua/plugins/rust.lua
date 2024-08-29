return {
  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      opts.server.default_settings["rust-analyzer"] = {
        cargo = {
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
          -- features = { "full" },
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
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
      }
      return opts
    end,
  },
}
