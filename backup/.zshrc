# Path to your oh-my-zsh installation.o
export ZSH=/Users/thinhphan/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="spaceship"

# Default User
DEFAULT_USER="thinhphan"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colored-man-pages git git-flow node npm brew osx zsh-autosuggestions zsh-wakatime zsh-syntax-highlighting docker docker-compose)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# Add tmuxinator
#source ~/.bin/tmuxinator.zsh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nano'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# SSH
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# This alias reloads this file
alias reload_profile='source ~/.profile'
alias reload_zshrc='source ~/.zshrc'
alias reload_bashrc='source ~/.bashrc'

# clear zsh log
alias clear_zsh_log='sudo rm -rf /private/var/log/asl/*.asl'

# Mac get stuck very often and are extremely slow and unstable on shutdowns.
# This forces a shutdown.
alias poweroff='sudo /sbin/shutdown -h now'
alias reboot='sudo /sbin/reboot'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

#########  System ##########
# -p: make any parent dirs, -v: help find a typo
alias mkdir="mkdir -pv"
# -c: flag in order to continue the download in case of problems
alias wget="wget -c"
# handy shortcuts
alias h='history'
# -i: flag forces the user confirm before it happen if something wrong.
alias rm="rm -i"
alias cp="cp -i"
# See most used commands in history
alias tophistory="history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10"
alias c='clear'

#### Set of commands ###
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias today='date +"%T %d-%m-%Y"'

## Control output of networking
alias ping='ping -c 10'
alias fastping='ping -c 20 -s.2'

# Show folder as tree or simple: brew install tree :)
#alias treee="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias tree="tree -AC"

# Tmux
alias opentmux="tmux a || tmux"

#########  Developer ###########
################################

# RVM
export PATH="$PATH:$HOME/.rvm/bin"

# NPM : Both 2 lines below are same results
export PATH="$HOME/.npm-packages/bin:$PATH"
# OR
# export PATH=$PATH:$(npm config get prefix)/bin

# Android SDK
#export PATH="/Users/thinhphan/Library/Android/sdk/platform-tools:$PATH"

# NodeJS

# NVM - load, completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# Test iterm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/thinhphan/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/thinhphan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/thinhphan/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/thinhphan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# Go Lang
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin

export IDF_PATH="/Volumes/Backup/github/iot/esp/esp-idf"

[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

# >>> Google Cloud SDK >>>
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/thinhphan/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/thinhphan/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/thinhphan/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/thinhphan/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
# <<< Google Cloud SDK <<<

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/erlang@19/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

export PATH="$PATH:~/.platformio/penv/bin"

## SPACESHIP THEME CUSTOMIZE ##
# https://denysdovhan.com/spaceship-prompt/docs/Options.html
###############################
# Prompt
SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"

# Char
SPACESHIP_CHAR_SUFFIX=(" ")
SPACESHIP_CHAR_COLOR_SUCCESS="green"
SPACESHIP_USER_SHOW="true"
# <<< Spaceship Theme <<<

