#
#        _             _
#    ___| | ___   __ _(_)_ __
#   |_  / |/ _ \ / _` | | '_ \
#  _ / /| | (_) | (_| | | | | |
# (_)___|_|\___/ \__, |_|_| |_|
#                |___/
#
# @samyakbardiya

#=============================#
# Setting things after .zshrc #
#=============================#

eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# if [ -d "${PHPENV_ROOT}" ]; then
#   eval "$(phpenv init -)"
# fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

eval "$(jenv init -)"

eval "$(zoxide init zsh --cmd d)"

