lvim.format_on_save = {
  enabled = true,
  pattern = "*",
  timeout = 1000,
  filter = require("lvim.lsp.utils").format_filter,
}

local status, formatters = pcall(require, "lvim.lsp.null-ls.formatters")
if not status then
  return
end

formatters.setup({
  -- { command = "black", filetypes = { "python" } },
  { name = "stylua" },
})
