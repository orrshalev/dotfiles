#!/bin/sh

# history
HISTFILE=~/.zsh_history

# plugins
if [ -f "$HOME/.local/share/zap/zap.zsh" ]; then
  source "$HOME/.local/share/zap/zap.zsh"
  plug "zsh-users/zsh-autosuggestions"
  plug "hlissner/zsh-autopair"
  plug "zap-zsh/supercharge"
  plug "zap-zsh/vim"
  plug "zsh-users/zsh-syntax-highlighting"
fi

# custom scripts
source "$HOME/.config/zsh/functions.zsh"
source "$HOME/.config/zsh/envvars.zsh"
source "$HOME/.config/zsh/platform-dependent.zsh"
source "$HOME/.config/zsh/prompt.zsh"
source "$HOME/.config/zsh/shortcuts.zsh"
source "$HOME/.config/zsh/replacements.zsh"
source "$HOME/.config/op/plugins.sh" &> /dev/null # OnePassword, idc if this fails


# Keybinds
bindkey '^ ' autosuggest-accept

# Program ad-ons
source "$HOME/.config/zsh/adons.zsh"

# bun completions
[ -s "/home/orr/.bun/_bun" ] && source "/home/orr/.bun/_bun"

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HSA_OVERRIDE_GFX_VERSION=10.3.0

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/orrshalev/.sdkman"
[[ -s "/home/orrshalev/.sdkman/bin/sdkman-init.sh" ]] && source "/home/orrshalev/.sdkman/bin/sdkman-init.sh"

eval "$(direnv hook zsh)"
