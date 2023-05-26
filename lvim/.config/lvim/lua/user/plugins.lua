lvim.plugins = {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestions = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{ "folke/tokyonight.nvim" },
	{
		"toppair/peek.nvim",
		filetype = "markdown",
		build = "deno task --quiet build:fast",
		init = function()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{ "tpope/vim-fugitive" },
}

table.insert(lvim.plugins, {
	"zbirenbaum/copilot-cmp",
	event = "InsertEnter",
	dependencies = { "zbirenbaum/copilot.lua" },
	config = function()
		local ok, cmp = pcall(require, "copilot_cmp")
		if ok then
			cmp.setup({})
		end
	end,
})

lvim.builtin.telescope.on_config_done = function(telescope)
	pcall(telescope.load_extension, "frecency")
end
