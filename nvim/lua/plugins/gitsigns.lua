return {
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      local original_on_attach = opts.on_attach

      opts.on_attach = function(buffer)
        if original_on_attach then
          original_on_attach(buffer)
        end

        local gs = package.loaded.gitsigns

        pcall(vim.keymap.del, "n", "]h", { buffer = buffer })
        pcall(vim.keymap.del, "n", "[h", { buffer = buffer })

        local function map(lhs, direction, diff_key, desc)
          vim.keymap.set("n", lhs, function()
            if vim.wo.diff then
              vim.cmd.normal({ diff_key, bang = true })
            else
              gs.nav_hunk(direction)
            end
          end, { buffer = buffer, desc = desc, silent = true })
        end

        map("<leader>j", "next", "]c", "Next Hunk")
        map("<leader>k", "prev", "[c", "Prev Hunk")
      end
    end,
  },
}
