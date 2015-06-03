# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source alias file
if [[ -s "${ZDOTDIR:-$HOME}/.zalias" ]]; then
  source "${ZDOTDIR:-$HOME}/.zalias"
fi

# Switch to foreground application
ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N ctrl-z
bindkey '^Z' ctrl-z
