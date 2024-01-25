#!/usr/bin/env zsh

# search process
function sp() {
    ps aux | grep $1
}
