# Mikhail Mitiaev's dotfiles

My configuration files for tmux, zsh, and so on.

Used on Debian-likes and macOS. Might work elsewhere.

## Setup

General setup:

1. install `stow`
1. `cd home`
1. stow whatever you want. For example, `stow -t "$HOME" tmux vim` grabs tmux and vim config

On macOS, switch to the GNU versions:

1. `brew install coreutils grep gnu-sed gnu-tar gnu-which`
1. Add `"$(brew --prefix coreutils)/libexec/gnubin"` to `$PATH` (replacing `coreutils` with `grep`, `gnu-sed`, etc)
1. `alias ls='ls --color=auto'`

Set up Vim thesaurus:

1. Download a MyThes thesaurus file (grab the `.dat` file from [this ZIP](https://lingucomponent.openoffice.org/MyThes-1.zip))
1. `script/parse-thesaurus /path/to/th_en_US_new.dat > ~/.cache/lcd1232-vim-thesaurus`
