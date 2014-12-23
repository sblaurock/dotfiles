#!/bin/bash

shopt -s dotglob nullglob

for i in * ; do
  if [[ $i != '.git'* ]] && [[ $i == .* ]] ; then
    cp -R $i "${HOME}/${i}"
  fi
done

echo "Installation complete."
exit 0
