# Mikhail Mitiaev's dotfiles

My configuration files, managed with [chezmoi](https://www.chezmoi.io/).

The chezmoi source lives in `home/` (see `.chezmoiroot`). File names follow chezmoi conventions: `dot_config` becomes `.config`, and `executable_foo` becomes `foo` with the executable bit set.

## Setup

On a new machine:

```sh
chezmoi init --apply lcd1232/dotfiles
```

Day to day:

```sh
chezmoi diff            # what apply would change
chezmoi apply           # write files to $HOME
chezmoi add ~/.foo      # start managing a file
chezmoi re-add          # pull local edits of managed files back into the repo
chezmoi cd              # open a shell in the source repo to commit/push
```

## Omarchy theme

The custom theme lives in `home/dot_config/omarchy/themes/wheel-of-time/`. Omarchy keeps the *selected* theme and wallpaper in `~/.local/state`, so the choice is stored in `home/.chezmoidata/omarchy.toml`. `run_onchange_after_omarchy-theme.sh.tmpl` runs `omarchy theme set` and `omarchy theme bg set` whenever that choice or the theme files change. On machines without Omarchy, the script is empty and skipped.

## Vim thesaurus

1. Download a MyThes thesaurus file (grab the `.dat` file from [this ZIP](https://lingucomponent.openoffice.org/MyThes-1.zip))
1. `script/parse-thesaurus /path/to/th_en_US_new.dat > ~/.cache/lcd1232-vim-thesaurus`
