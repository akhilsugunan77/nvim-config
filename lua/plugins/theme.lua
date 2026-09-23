vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })

local scheme = require("catppuccin")

scheme.setup({
  flavour = "macchiato",
  transparent_background = true,
  float = {
    transparent = true,
  },
  custom_highlights = function(colors)
    return {
      PmenuBorder = { fg = colors.mauve, bg = "NONE" }, -- Using a bright accent color so it's visible
      PmenuSel = { bg = colors.surface1, fg = colors.mauve, style = { "bold" } },
    }
  end,
})

vim.cmd.colorscheme("catppuccin-nvim")
