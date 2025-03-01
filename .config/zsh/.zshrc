
#
#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#
#
# @samyak039

#######
# zsh #
#######

## p10K
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## History
setopt HIST_IGNORE_ALL_DUPS # Remove older command from the history if a duplicate is to be added.
export HISTFILE="$XDG_STATE_HOME/zsh/history"

## input / output
bindkey -e # Set editor default keymap to emacs (`-e`) or vi/vim (`-v`)
setopt CORRECT # Prompt for spelling correction of commands.
WORDCHARS=${WORDCHARS//[\/]} # Remove path separator from WORDCHARS.
# SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? ' # Customize spelling correction prompt.

unsetopt beep # beep-beep

###########################
# pre zimfw customization #
###########################

### completion
zstyle ':completion::complete:*' cache-path ${XDG_CACHE_HOME}/zsh/zcompcache
zstyle ':zim:completion' dumpfile ${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}

### fzf-tab
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' popup-min-size 120 20 # WxH
zstyle ':fzf-tab*' fzf-min-height 20
zstyle ':fzf-tab:complete:cd:*' fzf-min-height 30
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
zstyle ':fzf-tab:complete:cht.sh:argument-1' fzf-preview 'cht.sh $word'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'

### fzf-tab-source
zstyle ':fzf-tab:sources' config-directory /the/directory/containing/your/source.zsh

### fzf-zsh-plugin
export FZF_PREVIEW_ADVANCED=true

### git
# Set a custom prefix for the generated aliases. The default prefix is 'G'.
zstyle ':zim:git' aliases-prefix 'g'

### ohmyzsh/nvm
# zstyle ':omz:plugins:nvm' lazy yes
# zstyle ':omz:plugins:nvm' lazy-cmd eslint prettier typescript tsc
# zstyle ':zim:ohmyzsh:plugins:nvm' lazy yes

### pacman
zstyle ':zim:pacman' priv_cmd 'doas'

### termtitle
# set the titles to show the command name typed by the user while the command
# is being executed and then the current directory name after the command ended
# (i.e. before each prompt)
zstyle ':zim:termtitle' hooks 'preexec' 'precmd'
zstyle ':zim:termtitle:preexec' format '${${(A)=1}[1]}'
zstyle ':zim:termtitle:precmd'  format '%1~'

### zim
# use degit instead of git
zstyle ':zim:zmodule' use 'degit'

### zsh-autosuggestion
# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
# ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion history)

### zsh-history-substring-search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=magenta,bold"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=red,bold"

### zsh-syntax-highlighting
# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets cursor root)


#########
# zimfw #
#########
ZIM_HOME=${XDG_CONFIG_HOME:-$HOME/.config}/zim

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh > /dev/null
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh > /dev/null
  fi
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh


#####################
# post zimfw config #
#####################

source ${ZDOTDIR}/aliasrc
source ${ZDOTDIR}/functionrc

zmodload -F zsh/terminfo +p:terminfo

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

## p10K
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ${ZDOTDIR}/.p10k.zsh ]] || source ${ZDOTDIR}/.p10k.zsh


##############
# load tools #
##############

eval "$(pyenv virtualenv-init -)"
# [ -d "${PHPENV_ROOT}" ] && eval "$(phpenv init -)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
eval "$(jenv init -)"
eval "$(zoxide init zsh --cmd d)"
