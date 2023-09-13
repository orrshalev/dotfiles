return {
  "nvim-telescope/telescope-project.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-file-browser.nvim"
  },
  config = function()
    require("telescope").load_extension("project")
  end
}
