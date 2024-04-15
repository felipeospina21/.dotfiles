-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

vim.api.nvim_create_augroup("setGolangIndent", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Golang files indent",
  group = "setGolangIndent",
  pattern = "*.go",
  callback = function()
    vim.bo.expandtab = false
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

vim.api.nvim_create_augroup("setNpmMakeprg", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Set npm as makeprg",
  group = "setNpmMakeprg",
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function() vim.opt.makeprg = "npm" end,
})
