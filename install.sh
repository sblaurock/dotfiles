#!/bin/bash

shopt -s dotglob nullglob

REPO_OH_MY_FISH='https://github.com/bpinto/oh-my-fish.git'
REPO_POWERLINE_FONTS='https://github.com/powerline/fonts.git'
REPO_VUNDLE='https://github.com/gmarik/Vundle.vim.git'

# Copy config files to home directory.
for i in * ; do
  if [[ $i != '.git' ]] && [[ $i != '.gitignore' ]] && [[ $i == .* ]] ; then
    rm -rf "${HOME}/${i}"
    cp -R $i "${HOME}/${i}"
  fi
done

# Resolve dependency: Fish shell
if [ ! -f /usr/local/bin/fish ] ; then
  brew install fish
  echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
  if [ -f /usr/local/bin/fish ] ; then
    chsh -s /usr/local/bin/fish
  else
    echo "Installation failed."
    exit 1
  fi
fi

# Resolve dependency: Oh My Fish!
if [ ! -d "${HOME}/.oh-my-fish" ] ; then
  git clone $REPO_OH_MY_FISH ~/.oh-my-fish
  cp ~/.oh-my-fish/templates/config.fish ~/.config/fish/config.fish
fi

# Resolve dependency: Powerline fonts
if [ ! -f "${HOME}/Library/Fonts/Anonymice Powerline.ttf" ] ; then
  git clone $REPO_POWERLINE_FONTS "${HOME}/.powerline-fonts"
  cd "${HOME}/.powerline-fonts"
  ./install.sh
  rm -rf "${HOME}/.powerline-fonts"
fi

# Resolve dependency: Vundle
if [ ! -f "${HOME}/.vim/bundle/Vundle.vim" ] ; then
  git clone $REPO_VUNDLE ~/.vim/bundle/Vundle.vim
fi

echo "Installation complete."
exit 0
