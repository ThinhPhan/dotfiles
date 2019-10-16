# dotfiles
Setup workspace environment.

## For new machine

> Your Macbook is getting old now and time to retired.
> Setup for your new Macbook.


```sh
./osx.sh
```

The Install Script

- Applications install.

- Restores App configs

- Environments and Dev Configs

## Backup your dotfiles

`Manual` input dotfiles that you want to backup in `Dotfiles`. Add automaticall dotfiles will cause trouble that files you dont want
and keep it clean.

Run backup

```sh
./backup.sh
```

## Restore (Comming soon)

```sh
./install.sh
```

## What's included:
- [x] a `.bashrc`, `.zshrc`, files
- [] a set of bash aliases -> TODO: Split into file `.alias`
- [] some useful scripts
- [] installs https://github.com/gpakosz/.tmux
- [] a custom theme for `tmux`
- [] a `vimrc` file
- [] `VSCode` configuration including list of installed packages
- [] `iTerm` profile
- [] `Homebrew` bundle. I listed all of the applications that I frequently use in a Brewfile. It was nice not having to download and install all of these manually.
- [] `Mackup` backup. I used mackup to backup the configurations of my applications.
- [] `Zsh` configs. I backed these up manually in the dotfiles repository to sync them to github. This allows others to see my current terminal settings and gives me piece of mind (mackup is not flawless).

## NOTICE

> Fresh copy from others, don't have time to review and testing. Use with care!!

- [stefanjudis/dotfiles](https://github.com/stefanjudis/.dotfiles)
`functions.sh` 
`vscode.sh`
`aliases.zsh`
`mac.sh`
`node.sh`
`vim.sh`
`vscode-settings.json`
`install.sh`


- [Unknown sources]()
`lib.sh`
`osx.sh`
