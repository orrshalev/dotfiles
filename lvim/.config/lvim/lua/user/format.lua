lvim.format_on_save = {
	enabled = true,
	pattern = "*",
	timeout = 1000,
	filter = require("lvim.lsp.utils").format_filter,
}
