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
