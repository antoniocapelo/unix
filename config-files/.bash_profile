# enable the git bash completion commands
#source ~/.git-prompt.sh
#source ~/.git-completion.sh
 
# be nice
alias please=sudo

# a better grep
# alias grep='/usr/local/bin/ggrep --color'

## execute sicstus
alias sics='cd /usr/local/sicstus4.2.3/bin && ./sicstus'
# case insensitive tab completion
bind "set completion-ignore-case on"


# alias to quickly show if any Handbrake processes are running
alias hb='sudo ps -aef | grep HandBrakeCLI'

# Reload bash settings after changes
alias reload_profile=". ~/.bash_profile"

# alias for quick DNS cache flushing
alias fc='sudo dscacheutil -flushcache'

#git status
alias gs='git status'

#git checkout 
alias gco='git checkout'

#git branches
alias branches='git branch -v -a'

#grunt serve
alias gruntcenas='grunt serve'

#javascript console
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'

# Create a new directory and enter it
function mkcd() {
    mkdir -p "$@" && cd "$@"
}

# Remove a direcory and its files
function removedir() {
    rm -rf "$@"
}


#alias de comandos
alias cdlei='cd ~/Dropbox/LEI'
alias cdlei21='cd ~/Dropbox/LEI/Ano\ 2/Semestre\ 3/'
alias cdlei22='cd ~/Dropbox/LEI/Ano\ 2/Semestre\ 4/'
alias ..='cd ..'
alias htdocs='cd ~/../../Applications/XAMPP/xamppfiles/htdocs'
alias xampp='open /Applications/XAMPP/XAMPP\ Control.app/'
alias chrome='open /Applications/Google\ Chrome.app/'
alias vlc='open /Applications/VLC.app/'
alias spotify='open /Applications/Spotify.app/'
alias tree='sh tree.sh'
alias find_and_replace_in_files='sh find_and_replace_in_files.sh'

shopt -s checkwinsize

# enable git unstaged indicators - set to a non-empty value
GIT_PS1_SHOWDIRTYSTATE="."

# enable showing of untracked files - set to a non-empty value
GIT_PS1_SHOWUNTRACKEDFILES="."

# enable stash checking - set to a non-empty value
GIT_PS1_SHOWSTASHSTATE="."

# enable showing of HEAD vs its upstream
GIT_PS1_SHOWUPSTREAM="auto"


## Some Tips from https://github.com/kintoandar/dotfiles/blob/master/.bashrc ##

alias ll='ls -lha --color=auto'
alias vi='vim'
alias diffcookbook='diff -wru $(ls|sort|head -n1) $(ls|sort|tail -n1)|vim -'

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)


# Git Stuff

# Git push origin master
alias gitpom='git push origin master'


# set the prompt to show current working directory and git branch name, if it exists

# this prompt is a green username, black @ symbol, cyan host, magenta current working directory and white git branch (only shows if you're in a git branch)
# unstaged and untracked symbols are shown, too (see above)
# this prompt uses the short colour codes defined above
# PS1='${GREEN}\u${BLACK}@${CYAN}\h:${MAGENTA}\w${WHITE}`__git_ps1 " (%s)"`\$ '

# this is a cyan username, @ symbol and host, magenta current working directory and white git branch
# it uses the shorter , but visibly more complex, codes for text colours (shorter because the colour code definitions aren't needed)
# PS1='\[\033[0;36m\]\u@\h\[\033[01m\]:\[\033[0;35m\]\w\[\033[00m\]\[\033[1;30m\]\[\033[0;37m\]`__git_ps1 " (%s)"`\[\033[00m\]\[\033[0;37m\]\$ '
#PS1='\[\033[0;36m\]\u \[\033[00m\]in: \[\033[0;35m\]\w\[\033[00m\]\[\033[1;30m\]\[\033[0;37m\]` `\[\033[00m\]\[\033[0;37m\]\n- '
# PS1='\[\033[0;36m\]\u \[\033[00m\]in: \[\033[0;35m\]\w\[\033[00m\]\[\033[1;30m\]\[\033[0;37m\]`__git_ps1 " (%s)"`\[\033[00m\]\[\033[0;37m\]\n- '
# PS1='\[\033[0;36m\]\u \[\033[00m\]in: \[\033[0;35m\]\w\[\033[00m\]\[\033[1;30m\]\[\033[0;37m\]`__git_ps1 " (%s)"`\[\033[00m\]\[\033[0;37m\]\n`set_prefix2` '

# return the prompt prefix for the second line
function set_prefix {
    BRANCH=`__git_ps1`
    if [[ -z $BRANCH ]]; then
        echo "${NORMAL}-"
    else
        echo "${UNDERLINE}+"
    fi
}

function set_prefix2 {
    BRANCH=`__git_ps1`
    if [[ -z $BRANCH ]]; then
        echo "${NORMAL}-"
    else
        echo "${UNDERLINE}+"
    fi
}
# and here's one similar to Paul Irish's famous prompt ... not sure if this is the way he does it, but it works  :)
# \033[s = save cursor position
# \033[u = restore cursor position

# PS1='\[\e[01;37m\][\u@\h \w] \t $\[\e[0m\] '
# PS1='\n\[\033[0;35m\]\u\[\033[0;32m\]\w\[\033[0m\]$(__git_ps1)\n\$\[\033[0m\] '
# PS1='\n\[\033[0;35m\]\u\[\033[0;32m\]\w\[\033[0m\]$(__git_ps1)\n\$\[\033[0m\] '
# PS1='${MAGENTA}\u${WHITE} in ${GREEN}\w${WHITE}${MAGENTA}`__git_ps1 " on %s"`${WHITE}\033[60C \n`set_prefix`${NORMAL}${CYAN}\[\]${WHITE} '
# PS1='${MAGENTA}\u${WHITE} in ${GREEN}\w${WHITE}${MAGENTA}`__git_ps1 " on %s"`${WHITE}\033[40C (`date "+%a, %b %d"`)\r\n`set_prefix`${NORMAL}${CYAN}\033[s\033[1C ${WHITE} '
# PS1='${MAGENTA}\u${WHITE} in ${GREEN}\w${WHITE}${MAGENTA}`__git_ps1 " on %s"`${WHITE}\r\n`set_prefix`${NORMAL}${CYAN}\033[s\033[1C 
# PS1='${MAGENTA}\u${WHITE} in ${GREEN}\w${WHITE}${MAGENTA}`__git_ps1 " on %s"`${WHITE}\r\n`set_prefix`${NORMAL}${CYAN}\033[s\033[60C (`date "+%a, %b %d"`)\033[u${WHITE} '
#PS1='${MAGENTA}\u${WHITE} in ${GREEN}\w${WHITE}${MAGENTA}`__git_ps1 " on %s"`${WHITE}\r\n`set_prefix`${NORMAL}${CYAN}\033[s\033[1C '
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/usr/texbin:/Users/Capelo/.rvm/bin
# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/usr/texbin:/Users/Capelo/.rvm/bin
# export PATH=/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/usr/texbin:/Users/Capelo/.rvm/bin source /Users/antoniocapelo/.bash_profile
# eval "$(rbenv init -)"
# eval "$(rbenv init -)"
# eval "$(rbenv init -)"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.source /Users/Capelo/.rvm/scripts/rvm

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home
export M2_HOME=/Users/antoniocapelo/workspace/apache-maven-3.2.1
export M2=/Users/antoniocapelo/workspace/apache-maven-3.2.1/bin
export PATH=$PATH:$M2
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:/usr/local/sicstus4.2.3/bin


export NVM_DIR="/Users/antoniocapelo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NVM_DIR="/Users/antoniocapelo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NVM_DIR="/Users/antoniocapelo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
