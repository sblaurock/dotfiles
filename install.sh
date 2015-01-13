#!/bin/bash

shopt -s dotglob nullglob

ZSH='/usr/local/bin/zsh'
REPO_PREZTO='https://github.com/sorin-ionescu/prezto.git'
REPO_POWERLINE_FONTS='https://github.com/powerline/fonts.git'
REPO_VUNDLE='https://github.com/gmarik/Vundle.vim.git'

# Resolve dependency: Zsh
if [ ! -f $ZSH ] ; then
  if [[ "$OSTYPE" = "darwin"* ]] && type brew > /dev/null ; then
    brew install zsh
    echo $ZSH | sudo tee -a /etc/shells
    if [ -f $ZSH ] ; then
      chsh -s $ZSH
    else
      echo "Installation failed."
      exit 1
    fi
  else
    echo "Zsh requires manual install."
  fi
fi

# Resolve dependency: Prezto
if [ ! -d "${HOME}/.zprezto" ] ; then
  git clone --recursive $REPO_PREZTO "${HOME}/.zprezto"
  rm "${HOME}/.zprezto/runcoms/README.md"
  zsh -c 'setopt EXTENDED_GLOB; for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/* ; do ; ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" ; done'
  git pull && git submodule update --init --recursive
fi

# Resolve dependency: Powerline fonts
if [ ! -f "${HOME}/Library/Fonts/Anonymice Powerline.ttf" ] ; then
  git clone $REPO_POWERLINE_FONTS "${HOME}/.powerline-fonts"
  cd "${HOME}/.powerline-fonts"
  ./install.sh
  rm -rf "${HOME}/.powerline-fonts"
fi

# Copy config files to home directory.
for i in * ; do
  if [[ $i != '.git' ]] && [[ $i != '.gitignore' ]] && [[ $i == .* ]] ; then
    rm -rf "${HOME}/${i}"
    cp -R $i "${HOME}/${i}"
  fi
done

# Resolve dependency: Vundle
if [ ! -f "${HOME}/.vim/bundle/Vundle.vim" ] ; then
  git clone $REPO_VUNDLE ~/.vim/bundle/Vundle.vim
fi

echo "Installation complete."
exit 0
