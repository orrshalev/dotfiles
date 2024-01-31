#!/usr/bin/env zsh

# search process
function sp() {
    ps aux | grep $1
}

function le() {
    emacsclient -c -a "" &
    # Capture the PID of the last backgrounded job
    job_pid=$!
    # Wait for a brief moment to allow the command to fail or succeed
    sleep 0.05
    # Check if the emacsclient is still running
    if kill -0 $job_pid > /dev/null 2>&1; then
        disown
    else
        echo "Failed to start emacsclient."
    fi
}
