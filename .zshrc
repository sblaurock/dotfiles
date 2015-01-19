# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source alias file
if [[ -s "${ZDOTDIR:-$HOME}/.zalias" ]]; then
  source "${ZDOTDIR:-$HOME}/.zalias"
fi
