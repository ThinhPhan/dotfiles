#!/usr/bin/env sh

echo "\n"
echo "#############################"
echo "# Installing VSCode plugins from CLI"
echo "#############################"
echo "\n"

DOTFILES_DIR="$HOME/dotfiles"
VSCODE_EXTENSIONS_FILE="$DOTFILES_DIR/vscode_extensions"

## vscode
### install vscode extensions
while IFS= read -r line; do
  code --install-extension "$line"
done < "$VSCODE_EXTENSIONS_FILE"

# *********************************
# Configurations
# Visual studio code

if [ -L ~/Library/Application\ Support/Code/user/settings.json ]; then
  echo "found old visual studio code settings. removing..."
  rm ~/Library/Application\ Support/Code/User/settings.json
fi

### import settings - !!!NOTICE: Not mine settings, use with care.
VSCODE_SETTINGS_FOLDER="$HOME/Library/Application Support/Code/User/"
mkdir -p "$VSCODE_SETTINGS_FOLDER"
# or symlink: ln -s
mv "$DOTFILES_DIR/vscode-settings.json" "$VSCODE_SETTINGS_FOLDER/settings.json"