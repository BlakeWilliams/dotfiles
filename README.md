# My Dotfiles

This is my dotfiles repo which contains *most* of the configuration that I use
day to day to get things done.

Most files are decently documented.

## Setup / Usage

To get setup clone this repo and then run the included `setup.sh` script. The
`setup.sh` script should be run when setting up your system, adding new files,
or when you move this folder locally.

If you're not sure how to run `setup.sh`, use the following:

```
./setup.sh
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

This loop in combination with `gitignore` ignoring all files by default means
we can add any system specific scripts for `zsh` to `~/.zsh` and they'll be
sourced.
