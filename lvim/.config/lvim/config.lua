reload("user.plugins")
reload("user.keymaps")
reload("user.options")
reload("user.colorscheme")
reload("user.format")
reload("user.statusline")
reload("user.debugger.main")
reload("user.dashboard.main")
reload("user.lsp.main")
-- reload("user.autocommands")

require("lvim.lsp.manager").setup("marksman")
