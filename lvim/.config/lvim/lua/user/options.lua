local options = {
	shiftwidth = 2,
	tabstop = 2,
	relativenumber = true,
	mouse = "",
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	pumheight = 10,
	showmode = false,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 300,
	undofile = true,
	updatetime = 500,
	writebackup = false,
	expandtab = true,
	cursorline = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	linebreak = true,
	scrolloff = 8,
	sidescrolloff = 8,
	whichwrap = "bs<>[]hl",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

lvim.log.level = "info"
