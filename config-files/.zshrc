# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
# source /Library/Python/2.7/site-packages/powerline/bindings/zsh/powerline.zsh 
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="ys"
#ZSH_THEME="solarized-powerline"
ZSH_THEME="agnoster"
#ZSH_THEME="powerline"
ZSH_POWERLINE_SHOW_IP=false
ZSH_POWERLINE_SHOW_OS=false

DEFAULT_USER=`whoami`

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

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

# User configuration

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export ANDROID_HOME=/Users/capelo/Library/Android/sdk

PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home/bin
PATH=$PATH:/Users/capelo/workspace/apache-maven-3.3.9/bin
PATH=$PATH:/Users/capelo/workspace/apache-maven-3.3.9/bin/mvn
PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
PATH=$PATH:/usr/local/mysql/bin
PATH=$PATH:/Applications/nwjc
PATH=$PATH:/Applications/nwjs
PATH=$PATH:~/workspace/Mindera/chromedriver
PATH=$PATH:~/coding/exercism
PATH=$PATH:/usr/local/lib
PATH=$PATH:$HOME/.node/bin
PATH=$PATH:$HOME/.rvm/bin
PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
PATH=$PATH:/usr/local/bin/eslint

export PATH

export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

## Sourcing rvm so it can be run as function
#source "$HOME/.rvm/scripts/rvm"

# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

## Capelo stuff ------------------------

# Create a new directory and enter it
function mkcd() {
    mkdir -p "$@" && cd "$@"
}

alias remdir='rm -rf'

# Copy w/ progress
cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}

# change the osx vim to the brew one (if it exists)
#if [ -f /usr/local/bin/vim ]; then
    #alias vim='/usr/local/bin/vim'
#fi

# better ls
alias ll='ls -lha --color=auto'

# Global aliases
alias vi='vim'
alias v='vim'
alias h="hg"
alias s="subl"
alias o="open"
alias oo="open ."
alias mvim="/Applications/MacVim.app/contents/MacOS/MacVim"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

# Git Stuff -----------------------------

alias g="git"

# Git push origin master
alias gitpom='git push origin master'

#git status
alias gs='git status'

#git diff
alias gd='git difftool'

#git checkout 
alias gco='git checkout'

#git commit 
alias gci='git commit'

#git commit 
alias gcim='git commit -m'

#git branches
alias branches='git branch -v -a'

# Simple python server -----------------
alias simpleServer='python -m SimpleHTTPServer'

# Node Stuff ----------------------------
#grunt serve
alias gruntcenas='grunt serve'

# NPM, please
alias npmo='sudo npm'

# be nice
alias please=sudo

alias nw='/Applications/nwjs.app/Contents/MacOS/nwjs'

# previous folder
alias ...='cd -'

# Powerline Stuf -------------------------

# Setting vim mode in terminal --------------
alias vimmode="set -o vi"

# List all open ports (and processes using them)
alias lsp='sudo lsof -i -n -P | grep LISTEN'

# weather alias
alias weatherporto='curl http://wttr.in/Porto'

# ranger alias
alias ra='ranger'

# z jumper init
. /Users/capelo/workspace/github_repos/z/z.sh

export NVM_DIR="/Users/capelo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Calling nvm use automatically in a directory with a .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
      nvm use
    fi
}
add-zsh-hook chpwd load-nvmrc

# VEX AQA stuff
alias startMockServer="mvn mockserver:runForked -Ptest -pl frontend-tests"
alias stopMockServer="mvn mockserver:stopForked -Ptest -pl frontend-tests"
alias runAQATests="mvn -Ptest -pl frontend-tests test"

