local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'rust_analyzer', 'clangd', 'cmake', 'pylsp', 'ltex', 'bashls', 'cssls', 'html', 'java_language_server', 'marksman','matlab_ls', 'zls'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
    clangd = function()
      local clangd_opts = lsp_zero.preset('recommended')
      require('lspconfig').clangd.setup(clangd_opts)
    end,
    cmake = function()
      local cmake_opts = lsp_zero.preset('recommended')
      require('lspconfig').cmake.setup(cmake_opts)
    end,
    pylsp = function()
      local pylsp_opts = lsp_zero.preset('recommended')
      require('lspconfig').pylsp.setup(pylsp_opts)
    end,
    ltex = function()
      local ltex_opts = lsp_zero.preset('recommended')
      require('lspconfig').ltex.setup(ltex_opts)
    end,
    bashls = function()
      local bashls_opts = lsp_zero.preset('recommended')
      require('lspconfig').bashls.setup(bashls_opts)
    end,
    cssls = function()
      local cssls_opts = lsp_zero.preset('recommended')
      require('lspconfig').cssls.setup(cssls_opts)
    end,
    html = function()
      local html_opts = lsp_zero.preset('recommended')
      require('lspconfig').html.setup(html_opts)
    end,
    java_language_server = function()
        local java_language_server_opts = lsp_zero.preset('recomended')
        require('lspconfig').java_language_server.setup(java_language_server_opts)
    end,
    marksman = function()
      local marksman_opts = lsp_zero.preset('recommended')
      require('lspconfig').marksman.setup(marksman_opts)
    end,
    matlab_ls = function()
      local matlab_ls_opts = lsp_zero.preset('recommended')
      require('lspconfig').matlab_ls.setup(matlab_ls_opts)
    end,
    zls = function()
      local zls_opts = lsp_zero.preset('recommended')
      require('lspconfig').zls.setup(zls_opts)
    end, 
}
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

