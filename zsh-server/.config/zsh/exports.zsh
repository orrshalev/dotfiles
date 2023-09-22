#!/bin/sh
export PF_INFO="ascii title os host kernel uptime memory"
export EDITOR="lvim"
export VISUAL="$EDITOR"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin":$PATH
export PATH="/lib/jvm/graalvm-community-openjdk-20.0.2+9.1/bin":$PATH
export PATH="/usr/lib/kotlinc/bin":$PATH
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-21.0.0.0.35-1.rolling.fc38.x86_64"
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=header,grid --line-range :500 {}'"
export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_DEFAULT_COMMAND="fd --type f"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
