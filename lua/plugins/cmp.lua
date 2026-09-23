vim.opt.autocomplete = false
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'noselect' }

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
        end
    end,
})
