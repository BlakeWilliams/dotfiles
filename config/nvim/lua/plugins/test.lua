      vim.g.test_custom_strategies = { tbro = function() return require('tbro').send() end }
      vim.g.test_strategy = 'tbro'

return {
  {
    'janko-m/vim-test',
    lazy = false, -- TODO why can't this lazy load with keys?
    init = function()
      vim.cmd[[
        let g:test#custom_strategies = {'tbro': function('tbro#send')}
        let g:test#strategy = 'tbro'
      ]]
    end,
    keys = {
      { "<leader>rn", "<cmd>TestNearest<cr>", desc = "Run nearest test" },
      { "<leader>rc", "<cmd>TestFile<cr>", desc = "Run file tests" },
      { "<leader>ra", "<cmd>TestSuite<cr>", desc = "Run test suite" },
      { "<leader>rl", "<cmd>TestLast<cr>", desc = "Run last test" },
    },
  }
}
