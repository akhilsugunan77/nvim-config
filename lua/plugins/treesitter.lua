local parsers = {
  "javascript",
  "typescript",
  "tsx",
  "html",
  "css",
  "json",
  "astro",
  "svelte",
  "yaml",
  "toml",
  "jsdoc",
  "regex",
  "graphql",
  "bash",
}

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

local treesitter = require("nvim-treesitter")

treesitter.setup({})
treesitter.install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    if pcall(vim.treesitter.start, ev.buf) then
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
