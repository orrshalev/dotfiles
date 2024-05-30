#!/usr/bin/env zsh

if command -v bat &> /dev/null; then
  alias cat="bat -pp"
  alias catt="bat --theme \"Visual Studio Dark+\""
fi
if command -v batcat &> /dev/null; then
  alias cat="batcat -pp"
  alias catt="batcat --theme \"Visual Studio Dark+\""
fi

if command -v lvim &> /dev/null; then
    alias vim="lvim"
fi

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi

if command -v eza &> /dev/null; then
    alias ls="eza --icons --color=auto"
fi


if command -v grep &> /dev/null; then
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
fi


if command -v neofetch &> /dev/null && [[ $TERM == "xterm-kitty" ]]; then
    alias neofetch="neofetch --disable packages --kitty source"
fi

if command -v df &> /dev/null; then
    alias df='df -h'     # human-readable sizes
fi

if command -v free &> /dev/null; then
    alias free='free -m' # show sizes in MB
fi

if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi
