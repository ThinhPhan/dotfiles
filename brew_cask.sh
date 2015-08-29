apps=(

# Browsers
google-chrome
# firefox
# torbrowser

# Communication
slack
skype
viber
# adium

# Cloud Storage
dropbox
google-drive
evernote

# Supports
teamviewer
the-unarchiver
skitch
# sizeup

# Media
require_cask vlc
require_cask vox
require_cask vox-preferences-pane

###################################
# Developer

# Dev Tools
iterm2
fabric
tunnelblick

# Editors
sublime-text
atom
require_apm linter
require_apm linter-eslint
require_apm atom-beautify
mou
# macvim

# Versioning
gitx
sourcetree

# Design
# sketch
# sketchup

# UML
staruml

# Android Dev
android-studio
genymotion
virtualbox
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package && qlmanage -r