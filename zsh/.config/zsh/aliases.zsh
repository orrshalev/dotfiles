#!/bin/sh
# ssh servers
alias fservorr="ssh -p 7777 orrshalev@fservorr.xyz"

# replacement commands
alias vim="lvim"
alias ls="eza --icons --color=auto"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias neofetch="neofetch --disable packages --kitty source"

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

alias upgrade='sudo dnf upgrade --refresh'
alias szshrc='source $HOME/.zshrc'

function gitdc() {
  git add .
  git commit -m "idc"
}

if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi

case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
  defaults write -g InitialKeyRepeat -int 13 # normal minimum is 15 (225 ms)
  defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)

	;;

Linux)
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac

