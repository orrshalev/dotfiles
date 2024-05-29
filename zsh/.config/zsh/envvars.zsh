#!/usr/bin/env zsh

export PATH="$HOME/.local/bin":$PATH
export PATH="/usr/lib/kotlinc/bin":$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.local/bin/mx/:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"


# Editors
if command -v lvim >/dev/null 2>&1; then
    export EDITOR='lvim'
elif command -v nvim >/dev/null 2>&1; then
    export EDITOR='nvim'
elif command -v vim >/dev/null 2>&1; then
    export EDITOR='vim'
fi
export VISUAL="emacsclient -c -a ''"
