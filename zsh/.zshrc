# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/zsh

ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

# history
HISTFILE=~/.zsh_history


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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
