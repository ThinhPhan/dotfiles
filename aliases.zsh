alias edit_zshrc="vim ~/.zshrc"
alias edit_ohmyzsh="vim ~/.oh-my-zsh"

# This alias reloads this file
alias reload_profile='source ~/.profile'
alias reload_zshrc='source ~/.zshrc'
alias reload_bashrc='source ~/.bashrc'

alias update_antibody='antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh'

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
alias h='history'
# -i: flag forces the user confirm before it happen if something wrong.
alias rm="rm -i"
alias cp="cp -i"
alias tophistory="history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10"
alias c='clear'

#### Set of commands ###
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias today='date +"%T %d-%m-%Y"'

## Control output of networking
alias ping='ping -c 10'
alias fastping='ping -c 20 -s.2'

# Show folder as tree or simple: brew install tree :)
#alias treee="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias tree="tree -AC"

# OSX
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

# Tmux
alias opentmux="tmux a || tmux"
alias tma='tmux attach -d -t'
alias tmn='tmux new -s $(basename $(pwd))'
alias tml='tmux list-sessions'