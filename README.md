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

## Rebuilding an Omarchy machine

After a fresh Omarchy install, `chezmoi init --apply lcd1232/dotfiles` restores the setup in this order:

1. `run_onchange_before_10-packages.sh.tmpl` installs the extra repo and AUR packages listed in `.chezmoidata/packages.toml`.
2. Config files: Hyprland (`hypr/*.lua`), the Omarchy bar (`omarchy/shell.json`), branding, my own `lcd1232.clock` plugin, git, mise, zed, voxtype, easyeffects and others.
3. `.chezmoiexternal.toml` clones the bar plugins installed from git. It also clones the `hass` and `omashare` checkouts, which `~/.config/omarchy/plugins` symlinks to.
4. `run_onchange_after_20-mise.sh.tmpl` runs `mise install`.
5. `run_onchange_after_30-system.sh.tmpl` adds the RTC wake-alarm kernel parameter (`sudo` + `limine-update`), enables zerotier-one, and enables the fluxd, hyprmoncfgd and voxtype user services.
6. The Omarchy theme and wallpaper are applied.

Configs that are still Omarchy's defaults (terminals, starship, btop, …) are left out on purpose, so Omarchy's own versions are used. To refresh the package list, compare `pacman -Qqe` against `/usr/share/omarchy/install/omarchy-*.packages`.

## Vim thesaurus

1. Download a MyThes thesaurus file (grab the `.dat` file from [this ZIP](https://lingucomponent.openoffice.org/MyThes-1.zip))
1. `script/parse-thesaurus /path/to/th_en_US_new.dat > ~/.cache/lcd1232-vim-thesaurus`
