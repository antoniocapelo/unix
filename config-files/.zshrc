plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)

DISABLE_AUTO_TITLE="true"

# Initializes Oh My Zsh

# add a function path
fpath=($ZSH/functions $ZSH/completions $fpath)

# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit
#autoload -U promptinit; promptinit
#prompt pure


: ${ZSH_DISABLE_COMPFIX:=true}

# Set ZSH_CUSTOM to the path where your custom config files
# and plugins exists, or else we will use the default custom/
if [[ -z "$ZSH_CUSTOM" ]]; then
    ZSH_CUSTOM="$ZSH/custom"
fi

# Set ZSH_CACHE_DIR to the path where cache files should be created
# or else we will use the default cache/
if [[ -z "$ZSH_CACHE_DIR" ]]; then
    ZSH_CACHE_DIR="$ZSH/cache"
fi


# Load all of the config files in ~/oh-my-zsh that end in .zsh
# TIP: Add files you don't want in git to .gitignore

is_plugin() {
    local base_dir=$1
    local name=$2
    test -f $base_dir/plugins/$name/$name.plugin.zsh \
        || test -f $base_dir/plugins/$name/_$name
}
# Add all defined plugins to fpath. This must be done
# before running compinit.
for plugin ($plugins); do
    if is_plugin $ZSH_CUSTOM $plugin; then
        fpath=($ZSH_CUSTOM/plugins/$plugin $fpath)
    elif is_plugin $ZSH $plugin; then
        fpath=($ZSH/plugins/$plugin $fpath)
    fi
done

# Figure out the SHORT hostname
if [[ "$OSTYPE" = darwin* ]]; then
    # macOS's $HOST changes with dhcp, etc. Use ComputerName if possible.
    SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST=${HOST/.*/}
else
    SHORT_HOST=${HOST/.*/}
fi

# Save the location of the current completion dump file.
if [ -z "$ZSH_COMPDUMP" ]; then
    ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
fi

if [[ $ZSH_DISABLE_COMPFIX != true ]]; then
    # If completion insecurities exist, warn the user without enabling completions.
    if ! compaudit &>/dev/null; then
        # This function resides in the "lib/compfix.zsh" script sourced above.
        handle_completion_insecurities
        # Else, enable and cache completions to the desired file.
    else
        compinit -d "${ZSH_COMPDUMP}"
    fi
else
    compinit -i -d "${ZSH_COMPDUMP}"
fi

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
    if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
        source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
    elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
        source $ZSH/plugins/$plugin/$plugin.plugin.zsh
    fi
done

# Load all of your custom configurations from custom/
for config_file ($ZSH_CUSTOM/*.zsh(N)); do
    source $config_file
done
unset config_file

# Load the theme
if [ "$ZSH_THEME" = "random" ]; then
    themes=($ZSH/themes/*zsh-theme)
    N=${#themes[@]}
    ((N=(RANDOM%N)+1))
    RANDOM_THEME=${themes[$N]}
    source "$RANDOM_THEME"
    echo "[oh-my-zsh] Random theme '$RANDOM_THEME' loaded..."
else
    if [ ! "$ZSH_THEME" = ""  ]; then
        if [ -f "$ZSH_CUSTOM/$ZSH_THEME.zsh-theme" ]; then
            source "$ZSH_CUSTOM/$ZSH_THEME.zsh-theme"
        elif [ -f "$ZSH_CUSTOM/themes/$ZSH_THEME.zsh-theme" ]; then
            source "$ZSH_CUSTOM/themes/$ZSH_THEME.zsh-theme"
        else
            source "$ZSH/themes/$ZSH_THEME.zsh-theme"
        fi
    fi
fi




# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
#export TERM="xterm-256color"
# source /Library/Python/2.7/site-packages/powerline/bindings/zsh/powerline.zsh 
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="ys"
ZSH_THEME="solarized-powerline"
#ZSH_THEME=""
#ZSH_THEME="agnoster"
#ZSH_THEME="powerline"
ZSH_POWERLINE_SHOW_IP=false
ZSH_POWERLINE_SHOW_OS=false

DEFAULT_USER=`whoami`

# User configuration

#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
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

### Sourcing rvm so it can be run as function
#source "$HOME/.rvm/scripts/rvm"

## export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

## You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
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
. /Users/capelo/workspace/personal/z/z.sh

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

setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}
stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

