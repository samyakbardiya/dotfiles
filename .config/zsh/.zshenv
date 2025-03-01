#
#            _
#    _______| |__   ___ _ ____   __
#   |_  / __| '_ \ / _ \ '_ \ \ / /
#  _ / /\__ \ | | |  __/ | | \ V /
# (_)___|___/_| |_|\___|_| |_|\_/
#
#
# @samyakbardiya


###################
# XDG Directories #
###################

export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$UID"


#######################
# Default Directories #
#######################

export BIN="$XDG_BIN_HOME"
export CONFIG="$XDG_CONFIG_HOME"
export CACHE="$XDG_CACHE_HOME"
export DATA="$XDG_DATA_HOME"
export SCRIPT="$HOME/scripts"

export LEDGER_FILE_CURRENT="$HOME/papers/ledger/2024-25.journal"


########
# PATH #
########

# binaries
export PATH="${PATH}:${SCRIPT:-$HOME/scripts}"
export PATH="${PATH}:${SCRIPT:-$HOME/scripts}/crt"
export PATH="${PATH}:${SCRIPT:-$HOME/scripts}/statusbar"
export PATH="${PATH}:${XDG_BIN_HOME:-$HOME/.local/bin}"
export PATH="${PATH}:${XDG_CONFIG_HOME:-$HOME/.config}/tmux/plugins/t-smart-tmux-session-manager/bin"
export PATH="${PATH}:${XDG_DATA_HOME:-$HOME/.local/share}/applications"
export PATH="${PATH}:${XDG_CONFIG_HOME:-$HOME/.config}/emacs/bin"

# dart & flutter
export FLUTTER_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/fvm/default"
#export FLUTTER_ROOT=$(which flutter | rev | cut -d / -f3- | rev)
export PATH="${PATH}:$HOME/.pub-cache/bin"
export PATH="${PATH}:${XDG_DATA_HOME:-$HOME/.local/share}/fvm/default/bin"
export PATH="${PATH}:/usr/lib/dart/bin"

# java & android
# export JAVA_HOME='/usr/lib/jvm/default'
# export PATH="${PATH}:${JAVA_HOME:-/usr/lib/jvm/default}/bin"
export ANDROID_SDK_ROOT='/opt/android-sdk'
export ANDROID_SDK_ROOT="${HOME}/Android/Sdk"
export PATH="${PATH}:${ANDROID_SDK_ROOT}/emulator"
export PATH="${PATH}:${ANDROID_SDK_ROOT}/platform-tools"
export PATH="${PATH}:${ANDROID_SDK_ROOT}/tools"
export PATH="${PATH}:${ANDROID_SDK_ROOT}/tools/bin"
# `cmdline-tolos/bin` AFTER `tools/bin` only. need to override the above one
export PATH="${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin"

###############
# DEVELOP ENV #
###############

export _JAVA_AWT_WM_NONREPARENTING=1 # android studio

export CHROME_EXECUTABLE="/usr/bin/brave-beta" # Brave -> Chrome

# nodejs
export NVM_DIR="$XDG_DATA_HOME/nvm"
source /usr/share/nvm/init-nvm.sh

# PNPM
export PNPM_HOME="/home/samyak/.local/share/pnpm"
export PATH="${PNPM_HOME}:${PATH}"

# python
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"

# PHP
export PHPENV_ROOT="$XDG_DATA_HOME/phpenv"
if [ -d "${PHPENV_ROOT}" ]; then
  export PATH="${PHPENV_ROOT}/bin:${PATH}"
fi

# zsh
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

##########
# RICING #
##########
export FZF_DEFAULT_OPTS=" \
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"


#############
# XDG-Ninja #
#############

# export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
# export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
# alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias ldgr='ledger --init-file "$XDG_CONFIG_HOME"/ledgerrc --sort date'
alias startx='startx $XDG_CONFIG_HOME/X11/xinitrc'
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
export ANDROID_HOME="$XDG_DATA_HOME/android/sdk"
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export ATOM_HOME="$XDG_DATA_HOME/atom"
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal/config"
export CABAL_DIR="$XDG_DATA_HOME/cabal"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export DOOMDIR="$XDG_CONFIG_HOME/doom"
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
export FVM_CACHE_PATH="$XDG_DATA_HOME/fvm"
export FZF_PATH="$XDG_DATA_HOME/fzf"
export GHCUP_USE_XDG_DIRS=true
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export LEDGER_FILE="$HOME/papers/ledger/hledger.journal"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYTHONSTARTUP="/etc/python/pythonrc"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export STACK_XDG=1
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XCURSOR_PATH="/usr/share/icons:$XDG_DATA_HOME/icons"

########
# TEMP #
########

