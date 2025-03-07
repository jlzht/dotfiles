require('lint').linters_by_ft = {
  kotlin = {'ktlint'},
  python = {'ruff'},
  cpp = {'cpplint'},
  c = {'cpplint'}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
