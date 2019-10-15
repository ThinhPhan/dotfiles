# Update Homebrew, formulae, and packages

brew update
brew upgrade

# Install packages

apps=(
    coreutils
    moreutils
    findutils
    ack
    automake
    cmake
    mercurial
    openssl
    brew-cask-completion
    imagemagick
    imagesnap
    git
    git-flow
    gnu-sed
    grep
    psgrep
    shellcheck
    ssh-copy-id
    tree
    wget
    zsh
    getantibody/tap/antibody
    tmux
    nvm
)

# mackup - Save App configs into Dropbox and symlink it. Should to learn more.

brew install "${apps[@]}"

# Switch to zsh on Homebrew
chsh -s /usr/local/bin/zsh

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"