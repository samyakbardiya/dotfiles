#
#                         __ _ _
#    _____ __  _ __ ___  / _(_) | ___
#   |_  / '_ \| '__/ _ \| |_| | |/ _ \
#  _ / /| |_) | | | (_) |  _| | |  __/
# (_)___| .__/|_|  \___/|_| |_|_|\___|
#       |_|
#
# @samyak039


############
# DEFAULTS #
############
export BROWSER="firefox-developer-edition"
export BROWSER_ALT="brave-beta"
export EDITOR="nvim"
export READER="zathura"
export TERMINAL="alacritty"
export TERMINAL_ALT="wezterm"
export VSCODE="code"
# export MANPAGER="sh -c 'col -bx | bat -l man -p --theme default'"
# export TERM="screen-256color"
# export VISUAL="emacsclient -c -s doom -a 'emacs'"


##########
# STARTX #
##########
[[ -z "${DISPLAY}" ]] && [[ $XDG_VTNR -eq 1 ]] && exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
[[ -z "${DISPLAY}" ]] && [[ $XDG_VTNR -eq 2 ]] && exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
