apps=(

# Browsers
google-chrome

# Communication
slack
skype
# viber

# Cloud Storage
dropbox
# google-drive
# evernote

# Supports
teamviewer
anydesk
the-unarchiver
skitch
sizeup

# Media
vlc
vox
vox-preferences-pane

###################################
# Developer
###################################

# Support Tools
iterm2
## Fonts for Tools
font-fira-code

# tunnelblick
# flux

# Editors
sublime-text
# require_apm linter
# require_apm linter-eslint
# require_apm atom-beautify


# Versioning
gitx

# Design
# sketch
# sketchup

# UML
staruml

# Android Dev
# android-studio
# genymotion
# virtualbox

# Database
tableplus

vagrant
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
quicklook_exts=(
    qlcolorcode
    qlstephen
    qlmarkdown
    quicklook-json
    qlprettypatch
    quicklook-csv
    betterzipql
    webp-quicklook
    suspicious-package
)
brew cask install quicklook_exts && qlmanage -r