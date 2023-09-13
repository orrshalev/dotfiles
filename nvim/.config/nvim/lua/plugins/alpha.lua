return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    -- local INIT_PATH = "~/dotfiles/nvim/.config/nvim/init.lua"
    local INIT_PATH = "~/dotfiles/nvim/.config/nvim/init.lua"
    dashboard.section.header.val = {
      [[.-._           ,----.     _,.---._                                   ,-.-. .=-.-.       ___   ]],
      [[/==/ \  .-._ ,-.--` , \  ,-.' , -  `.   .-.,.---.   .-.,.---.  ,--.-./=/ ,//==/_ /.-._ .'=.'\ ]],
      [[|==|, \/ /, /==|-  _.-` /==/_,  ,  - \ /==/  `   \ /==/  `   \/==/, ||=| -|==|, |/==/ \|==|  |]],
      [[|==|-  \|  ||==|   `.-.|==|   .=.     |==|-, .=., |==|-, .=., \==\,  \ / ,|==|  ||==|,|  / - |]],
      [[|==| ,  | -/==/_ ,    /|==|_ : ;=:  - |==|   '='  /==|   '='  /\==\ - ' - /==|- ||==|  \/  , |]],
      [[|==| -   _ |==|    .-' |==| , '='     |==|- ,   .'|==|- ,   .'  \==\ ,   ||==| ,||==|- ,   _ |]],
      [[|==|  /\ , |==|_  ,`-._ \==\ -    ,_ /|==|_  . ,'.|==|_  . ,'.  |==| -  ,/|==|- ||==| _ /\   |]],
      [[/==/, | |- /==/ ,     /  '.='. -   .' /==/  /\ ,  )==/  /\ ,  ) \==\  _ / /==/. //==/  / / , /]],
      [[`--`./  `--`--`-----``     `--`--''   `--`-`--`--'`--`-`--`--'   `--`--'  `--`-` `--`./  `--` ]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Find File", "<CMD>Telescope find_files<CR>"),
      dashboard.button("n", "  New file", "<cmd>ene!<CR>"),
      dashboard.button("p", "  Projects", "<cmd>:lua require'telescope'.extensions.project.project{}<CR>"),
      dashboard.button("r", "  History", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("c", "  Configuration", "<CMD>edit " .. INIT_PATH .. " <CR>"),
      dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
    }
    local handle = io.popen('fortune')
    local fortune = handle:read("*a")
    handle:close()
    dashboard.section.footer.val = fortune

    dashboard.config.opts.noautocmd = true

    vim.cmd [[autocmd User AlphaReady echo 'ready']]

    alpha.setup(dashboard.config)
  end
}
