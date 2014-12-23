#!/bin/bash

shopt -s dotglob nullglob

for i in * ; do
  if [[ $i != '.git'* ]] && [[ $i == .* ]] ; then
    mv "${HOME}/${i}" "${HOME}/${i}.bak"
    cp -R $i "${HOME}/${i}"
  fi
done

echo "Installation complete."
exit 0