#!/usr/bin/env sh

if [ "$TERM" != "tmux-256color" ] && [ -z "$TMUX" ]; then
	echo "Please try inside a Tmux session"
	return 1
fi

if [ -z "$@" ]; then
	dir=$(zoxide query --interactive 1>&1)
else
	dir=$(zoxide query -- "$@" 1>&1)
fi

cd $dir

tmux rename-window "$(basename "$dir")"
