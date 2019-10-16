#!/usr/bin/env sh

echo ""
echo "#############################"
echo "# Installing applications via cask from cask.sh"
echo "#############################"
echo ""

# get current location
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# *********************************
# Clean up
brew cask uninstall --force visual-studio-code

# *********************************
# Install Prerequisites
brew tap caskroom/fonts

# *********************************
# Install Apps
apps=(
    # Browsers
    google-chrome

    # Communication
    slack
    skype
    telegram-desktop
    viber

    # Cloud Storage
    dropbox
    # google-drive
    # evernote

    # Supports
    teamviewer
    anydesk
    skitch
    sizeup

    # Media
    vlc
    vox
    vox-preferences-pane
    spotify

    ###################################
    # Developer

    # Support Tools
    iterm2
    tunnelblick
    ngrok
    adoptopenjdk
    # flux

    ## Fonts for Tools
    font-fira-code

    # Editors
    sublime-text
    visual-studio-code
    postman
    macdown
    pycharm-ce
    arduino
    insomnia
    typora

    # Versioning
    gitx

    # Design & Media
    sketch
    sketchup
    skitch
    handbrake
    imageoptim
    blender

    # UML
    staruml

    # Database
    tableplus
    dbeaver
    graphql-playground

    # microservices
    docker
    minikube
    vagrant

    # Ultility
    alfred
    balenaetcher
    cheatsheet
    keka
    # NTFS on Mac for free https://mounty.app/
    mounty
    the-unarchiver
    hammerspoon
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
quicklook_exts=(
    qlcolorcode
    qlimagesize
    qlmarkdown
    qlprettypatch
    qlstephen
    qlvideo
    quicklook-csv
    quicklook-json
    suspicious-package
    webpquicklook
)
brew cask install "${quicklook_exts[@]}" && qlmanage -r
