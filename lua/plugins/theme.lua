vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })

local scheme = require("catppuccin")

scheme.setup({
  flavour = "macchiato",
  transparent_background = true,
  float = {
    transparent = true,
  },
})

vim.cmd.colorscheme("catppuccin-nvim")
