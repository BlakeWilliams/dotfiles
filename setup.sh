#!/usr/bin/env sh

set -e

current_dir=$(pwd $0)
files=$(find . -maxdepth 1 -not -name '.*' -not -name 'setup.sh')

for file in $files; do
  dotfile=$(echo $file | sed "s|^./|$HOME/.|")
  absolute_path=$(echo $file | sed "s|^./|$current_dir/|")

  if [[ -a $dotfile ]]; then
    echo "Removing $dotfile"
    rm -rf "$dotfile"
  fi

  ln -s "$absolute_path"  "$dotfile"
done
