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
    brew-cask
    cmake
    mercurial
    mysql
    openssl
    imagemagick
    imagesnap
    git
    git-flow
    gnu-sed --default-names
    grep --default-names
    node
    psgrep
    python
    shellcheck
    ssh-copy-id
    svn
    tree
    vim --override-system-vi
    wget --enable-iri
)

brew install "${apps[@]}"