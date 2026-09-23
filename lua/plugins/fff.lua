-- Download before running :lua require("fff.download").download_or_build_binary()
vim.pack.add({ "https://github.com/dmtrKovalenko/fff" })

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "fff" and (kind == "install" or kind == "update") then
      if not ev.data.active then
        vim.cmd.packadd("fff")
      end
      require("fff.download").download_or_build_binary()
    end
  end,
})

vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}

vim.keymap.set("n", "<leader>ff", function()
  require("fff").find_files()
end, { desc = "FFFind files" })
vim.keymap.set("n", "<leader>fg", function()
  require("fff").live_grep()
end, { desc = "FFFind live content grep" })
vim.keymap.set("n", "<leader>fc", function()
  require("fff").live_grep_under_cursor()
end, { desc = "FFFind word under cursor" })
