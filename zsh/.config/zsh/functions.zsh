#!/usr/bin/env zsh

function ke {
    pgrep -f 'emacs --daemon' | xargs -r kill
}
