#!/bin/bash

for i in * ; do
  if [ -d "$i" ]; then
    mv "${HOME}/.${i}" "${HOME}/.${i}.bak"
    cp -R $i "${HOME}/.${i}"
  fi
done

echo "Installation complete."
exit 0