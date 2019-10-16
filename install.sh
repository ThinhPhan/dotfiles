#!/usr/bin/env bash

# this script is downloaded from the config repo and run on
# a new machine to reinstall all packages, configure dotfiles,
# and set up preferences

# secret, set up my SSH
# secret, set up git
# .dotfiles paths

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$DOTFILE_DIR/backup"

BREW_INSTALLS_FILE="$DOTFILES_DIR/brew_bundle_dump"
VSCODE_EXTENSIONS_FILE="$DOTFILES_DIR/vscode_extensions"

# Clone my dotfiles repo: $DOTFILES_DIR is my local folder where
# backup copies of all my dotfiles and config are saved.
git clone --depth=1 git@github.com:ThinhPhan/dotfiles.git "$DOTFILES_DIR" || {
  printf "Error: git clone of configuration repo failed\n"
  exit 1
}

# Copy dotfiles into homedir
cp -a "$BACKUP_DIR/." "$HOME"
git config --global core.excludesfile "$DOTFILES_DIR/.gitignore_global"

# Install Homebrew
if test ! "$(command -v brew)"; then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# Install all brew packages
brew update-reset && brew update
brew tap homebrew/bundle
brew bundle install --file="$BREW_INSTALLS_FILE"
brew upgrade --all && brew cleanup

# Set up packages just installed via homebrew

# bootstrap my backup script
"$DOTFILES_DIR/backup.sh"

# *******************************************************************************

# get current location
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "running from $DIR..."

# **********************************
# GIT
#

# remove ~/.gitconfig
if [ -f ~/.gitconfig ]; then
  echo "found old ~/.gitconfig - removing..."
  rm ~/.gitconfig
fi

# link ~/.gitconfig
echo "sym linking new ~/.gitconfig with $DIR/.gitconfig!\n"
ln -s $BACKUP_DIR/.gitconfig ~/.gitconfig

# *********************************
# zsh + Oh-my-Zsh
#
if [ -L ~/.zshrc ]; then
  echo "found .zshrc - removing..."
  rm ~/.zshrc
fi

echo $'linking .zshrc\n'
ln -s $BACKUP_DIR/.zshrc ~/.zshrc

# if [ -L $ZSH_CUSTOM/stefanjudis.zsh-theme ]; then
#   echo "found old stefanjudis.zsh-theme - removing..."
#   rm $ZSH_CUSTOM/stefanjudis.zsh-theme
# fi

# echo $'linking stefanjudis zsh-theme\n'
# ln -s $BACKUP_DIR/stefanjudis.zsh-theme $ZSH_CUSTOM/stefanjudis.zsh-theme


if [ -L $ZSH_CUSTOM/aliases.zsh ]; then
  echo "found old aliases.zsh - removing..."
  rm $ZSH_CUSTOM/aliases.zsh
fi

echo $'linking aliases.zsh\n'
ln -s $DIR/aliases.zsh $ZSH_CUSTOM/aliases.zsh

if [ -L $ZSH_CUSTOM/functions.zsh ]; then
  echo "found old functions.zsh - removing..."
  rm $ZSH_CUSTOM/functions.zsh
fi

echo $'linking functions.zsh\n'
ln -s $DIR/functions.zsh $ZSH_CUSTOM/functions.zsh


# *************************************
# npm
#
# if [ -L ~/.npmrc ]; then
#   echo "found old .npmrc - removing..."
#   rm ~/.npmrc
# fi

# echo $'linking .npmrc\n'
# ln -s $DIR/.npmrc ~/.npmrc


bash $DIR/brew.sh
bash $DIR/brew_cask.sh
bash $DIR/mac.sh
bash $DIR/node.sh
bash $DIR/vim.sh
bash $DIR/vscode.sh