return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  config = function()
    -- Keymaps for folding
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    -- press zc to fold the function 
    -- press zo to unfold the function

    -- UI fold settings
    vim.o.foldcolumn = '1'        -- Show fold column (like sign column)
    vim.o.foldlevel = 99          -- Ensure folds are open
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true       -- Enable folding
    vim.o.mouse = 'a'             -- Enable mouse support

    -- Tree-sitter fold method
    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

    -- UFO setup
    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end,
    })
  end
}
