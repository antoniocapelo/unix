# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

###### CAPELO STUFF #####

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias nw="/Applications/node-webkit.app/Contents/MacOS/node-webkit";
alias nwsnapshot="/Applications/nwsnapshot";

# a better grep
alias grep='/usr/local/bin/grep'

## MongoDB
alias mongo_start='mongod --config /usr/local/etc/mongod.conf'

## execute sicstus
alias sics='cd /usr/local/sicstus4.2.3/bin && ./sicstus'
# case insensitive tab completion
# bind "set completion-ignore-case on"

# alias for atom code editor
alias atom='/Applications/Atom.app/Contents/MacOS/Atom'

# alias to quickly show if any Handbrake processes are running
alias hb='sudo ps -aef | grep HandBrakeCLI'

# Reload bash settings after changes
alias reload_profile=". ~/.bash_profile"

# alias for quick DNS cache flushing
alias fc='sudo dscacheutil -flushcache'

#git status
alias gs='git status'

#sublime text 3 alias
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

#git branches
alias branches='git branch -v -a'

#grunt serve
alias gruntcenas='grunt serve'

#git checkout 
alias gco='git checkout'

#javascript console
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'

# Default editor
export EDITOR='subl -w'

# Create a new directory and enter it
function mkcd() {
    mkdir -p "$@" && cd "$@"
}

# List complete with most recent last
alias lt='ls -lrth'

# Remove a direcory and its files
function removedir() {
    rm -rf "$@"
}

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

alias iosSimulator="open /Applications/iOS\ Simulator\ alias"

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Z stuff

. /Users/antoniocapelo/coding/GitHub\ Repos/z_zsh/z.sh

###### ##### ##### #####


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

## Increase number of fd's per process
ulimit -n 1024

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/antoniocapelo/workspace/apache-maven-3.2.1/bin:/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home/bin:/usr/local/sicstus4.2.3/bin"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home
export M2_HOME=/Users/antoniocapelo/workspace/apache-maven-3.2.1
export M2=/Users/antoniocapelo/workspace/apache-maven-3.2.1/bin
export PATH=$PATH:$M2
# export PATH=$PATH:$JAVA_HOME/bin
# export PATH=$PATH:/usr/local/sicstus4.2.3/bin

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export NVM_DIR="/Users/antoniocapelo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
