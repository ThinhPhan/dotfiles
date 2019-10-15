#!/bin/bash
# This script commits any local configuration changes and automatically
# pushes them to the remote.
#
# Uploads newest versions of dotfiles from the $HOME dir into
# $HOME/.BACKUP_CONFIG, a folder created by the provisioning script
# that is linked to the remote configuration repo.

DOTFILE_DIR="$HOME/dotfiles"
BACKUP_DIR="$DOTFILE_DIR/backup"
THIS_SCRIPT_FULL_PATH="$DOTFILE_DIR/$(basename -- "$0")"

mkdir -p "$BACKUP_DIR"
mkdir -p "$DOTFILE_DIR"

BREW_INSTALLS_FILENAME="brew_bundle_dump"
VSCODE_EXTENSIONS_FILENAME="vscode_extensions"

# Backup Brew Bundle
/usr/local/bin/brew bundle dump --force --file="$DOTFILE_DIR/$BREW_INSTALLS_FILENAME"

# Backup VSCode extensions
/usr/local/bin/code --list-extensions > "$DOTFILE_DIR/$VSCODE_EXTENSIONS_FILENAME"


# Same approach as code belows
# dotfile_list=("$HOME/.gitignore_global" "$HOME/.bashrc" "$HOME/.vimrc")
# for file in "${dotfile_list[@]}"; do cp "$file" "$DOTFILE_DIR"; done
while read f; do
    echo "Backup file $f..."
    cp -rf $HOME/$f $BACKUP_DIR
done < Dotfiles
echo "Backup files done, please commit!"

cd "$DOTFILE_DIR" || exit
if ! git diff --quiet HEAD || git status --short; then
    git add --all
    git commit -m "Backup at $(date -u)"
    git push origin master
fi

# Make this script call itself hourly from the crontab, if it isn't already.
if ! crontab -l | grep "$THIS_SCRIPT_FULL_PATH"; then
  (crontab -l ; echo "0 * * * * $THIS_SCRIPT_FULL_PATH > /dev/null 2>&1") | sort - | uniq - | crontab - 2>&1
fi