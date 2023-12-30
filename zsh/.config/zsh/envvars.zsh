#!/usr/bin/env zsh

export PATH="$HOME/.local/bin":$PATH
export PATH="/usr/lib/kotlinc/bin":$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.local/bin/mx/:$PATH"

# Editors
if command -v lvim >/dev/null 2>&1; then
    export EDITOR='lvim'
elif command -v nvim >/dev/null 2>&1; then
    export EDITOR='nvim'
elif command -v vim >/dev/null 2>&1; then
    export EDITOR='vim'
fi
export VISUAL="emacsclient -c -a ''"

# likely to remove
# export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-21.0.0.0.35-1.rolling.fc38.x86_64"
