# My Dotfiles

This is my dotfiles repo which contains *most* of the configuration that I use
day to day to get things done.

Most files are decently documented.

## Setup / Usage

To get setup, install [rcm](https://github.com/thoughtbot/rcm) and run the
following command:

```
env RCRC=$HOME/dotfiles/rcrc rcup
```

## System specific zsh includes

Different ststems often have different setups. For example one machine might
have `nvm`, and `rbenv` but another might only have `chruby` and no `nvm`. To
get around this the following line is included in `zshrc`:

```bash
for function in ~/.zsh/*; do
  source $function
done
```

This loop in combination with `gitignore` ignoring all files in the `.zsh`
directory we can add any system specific scripts for and they'll be sourced.
