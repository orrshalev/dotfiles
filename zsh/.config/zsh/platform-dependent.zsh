#!/bin/sh

case "$(uname -s)" in
Darwin)
	# echo 'Mac OS X'
  defaults write -g InitialKeyRepeat -int 13 # normal minimum is 15 (225 ms)
  defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)
	;;
Linux)
	# echo 'Linux'
	;;
CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac

