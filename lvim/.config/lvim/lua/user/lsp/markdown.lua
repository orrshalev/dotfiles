-- Markdown in Lunarvim is disabled by default. To enable it, remove the filetype
for i, filetype in ipairs(lvim.lsp.automatic_configuration.skipped_filetypes) do
  if filetype == "markdown" then
    table.remove(lvim.lsp.automatic_configuration.skipped_filetypes, i)
    break
  end
end
vim.cmd("LvimCacheReset")
-- Setup servers FOR WHATEVER REASON THESE LINES NEED TO BE IN CONFIG.LUA
-- require("lvim.lsp.manager").setup("marksman")
-- require("lvim.lsp.manager").setup("ltex")
-- Enable code highlighting for markdown files
-- vim.cmd("let g:markdown\_fenced\_languages = \['html', 'java', 'javascript', 'typescript', 'vim', 'lua', 'css'\]")
