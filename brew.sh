#!/usr/bin/env sh

echo "\n"
echo "#############################"
echo "# Installing various CLI programs from brew from brew.sh"
echo "#############################"
echo "\n"

# Update Homebrew, formulae, and packages

brew update
brew upgrade

# Install packages

apps=(
    ack
    automake
    brew-cask-completion
    cmake
    coreutils
    findutils
    getantibody/tap/antibody
    git
    git-flow
    gnu-sed
    grep
    imagemagick
    imagesnap
    mercurial
    moreutils
    nvm
    openssl
    psgrep
    shellcheck
    ssh-copy-id
    tmux
    tree
    wget
    zsh
    zsh-completions
    # a better `cd`
    exa
    autojump
    # a better `cat`
    bat
)

# mackup - Save App configs into Dropbox and symlink it. Should to learn more.

brew install "${apps[@]}"

# Switch to zsh on Homebrew
chsh -s /usr/local/bin/zsh

# ffmpeg for quick video compression
brew install ffmpeg --with-vpx --with-vorbis --with-libvorbis --with-vpx --with-vorbis --with-theora --with-libogg --with-libvorbis --with-gpl --with-version3 --with-nonfree --with-postproc --with-libaacplus --with-libass --with-libcelt --with-libfaac --with-libfdk-aac --with-libfreetype --with-libmp3lame --with-libopencore-amrnb --with-libopencore-amrwb --with-libopenjpeg --with-openssl --with-libopus --with-libschroedinger --with-libspeex --with-libtheora --with-libvo-aacenc --with-libvorbis --with-libvpx --with-libx264 --with-libxvid

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"