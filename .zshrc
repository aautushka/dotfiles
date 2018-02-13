# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/marina/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# set default text editor
export EDITOR=$(which vim)

# use vim key bindings
bindkey -v

# history and grep
alias hist="history"
alias hgrep="history | grep"
alias psgrep="ps -Af | grep --color"

# edit my dotfiles
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias tmuxconf="vim ~/.tmux.conf"

#This is based on: https://github.com/ranger/ranger/blob/master/examples/bash_automatic_cd.sh
#Paste this into your .zshrc:
function ranger-cd 
{
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi  
    rm -f -- "$tempfile"
}
bindkey -s '^O' 'ranger-cd\n'
#ranger-cd will fire for Ctrl+O

# do ranger-cd by default
alias ranger="ranger-cd"
alias rr="ranger-cd"
alias mypstree="pstree -s $$"
alias isranger="mypstree | grep --color ranger"
alias isr="mypstree | grep --color ranger"

# convenience keys
alias c="clear"
alias r="source ~/.zshrc"

# mp3 commands
function convert-m4b
{
    newname=$(echo $1 | sed s/m4b$/mp3/)
    ffmpeg -i "$1" -acodec libmp3lame "$newname"
}

function split-mp3
{
    newname=$(echo $1 | sed s/\.mp3$/-%03d\.mp3/)
    ffmpeg -i "$1" -f segment -segment_time 1800 -c copy "$newname"
}

# docker commands
function docker-rm-all
{
    docker rmi $(docker images -q)
    docker rm -f $(docker ps -a -q)
}

function mkcd
{
    mkdir "$1"
    cd "$1"
}

# tar shortcuts
alias targz="tar -zxvf"

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# cool fzf command from 
# https://github.com/junegunn/fzf/wiki/examples
# there's more on the link

# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
vf()
{
    local files
    files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})
    if [[ -n $files ]]
    then
        vim -- $files
        print -l $files[1]
    fi
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
# - Bypass fuzzy finder if there's only one match (--select-1)
# - Exit if there is no match (--exit-0)
fe() 
{
    local files
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Modified version where you can press
# - ^O to open with `open` command,
# - ^E or Enter key to open with the $EDITOR
fo()
{
    local out file key
    IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
    key=$(head -1 <<< "$out")
    file=$(head -2 <<< "$out" | tail -1)
    echo "hello $file"
    if [ -n "$file" ]; then 
        [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
    fi
}

# fuzzy grep open via ag
vg() 
{
    local file
    file="$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1 " +" $2}')"
    if [[ -n $file ]]
    then
        vim $file
    fi
}

# fd - cd to selected directory
fd()
{
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) && 
    cd "$dir"
}

# fh - repeat history
fh()
{
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fhe - repeat history
fhe()
{
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() 
{
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}


alias vimu="vim -u NONE"
alias make="make -j12"

# autojump - a faster way to navigate your filesystem
# https://github.com/wting/autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u


# https://github.com/changyuheng/zsh-interactive-cd
# if [ -f ~/zsh-interactive-cd.plugin.zsh ]; then
#     . ~/zsh-interactive-cd.plugin.zsh
# fi

# use vim for less
alias less="view -"

# golang
export GOROOT=/usr/lib/go-1.9/
export PATH=$GOROOT/bin:$PATH

# rm shortcut
alias rf="rm -rf"

# run tmux if it exists
if [ -x "$(command -v tmux)" ]; then
    if [[ "$TERM" != "screen-256color" ]]; then
        tmux attach-session -t "$USER" || tmux new-session -s "$USER"
    fi
fi

#disk usage aliases
alias dfh="df -h"
alias du1="du -hd1"

#cmake aliases
alias cmake-targets="cmake --build . --target help"

#ctags aliases
alias ctags-cpp="ctags --c++-kinds=+p --fields=+iaS --language-force=C++ -R ."

#elasticsearch convenience shortcuts
function es.docker.pull
{
    docker pull docker.elastic.co/elasticsearch/elasticsearch:6.2.0
}

function es.docker.run
{
    docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.2.0
}

function es.dump
{
    # $1 index name
    url="localhost:9200/$1/_search?pretty"
    curl -H "Content-Type: application/json" -X GET "$url"  -d '{"query": { "match_all": {} } }'
}

function es.rm
{
    # $1 index name
    curl -X DELETE "localhost:9200/$1?pretty"
}

function es.search 
{
    # $1 query
    curl -X GET "localhost:9200/_search?q=$1&pretty"
}

function es.search.in
{
    # $1 index
    # $2 query
    curl -X GET "localhost:9200/$1/_search?q=$2&pretty"
}

function es.get
{
    # $1 document path
    curl -X GET "localhost:9200/$1"
}

function es.add
{
    # $1 document path
    # $2 document json
    curl -H "Content-Type: application/json" -X POST "localhost:9200/$1?pretty" -d "$2"
}

function es.mapping
{
    # $1 document path
    curl "localhost:9200/$1/_mapping?pretty"
}

function es.count
{
    # $1 index
    post='{"query": { "bool": { "must": [{"match_all":{}}]}}}'
    url="localhost:9200/$1/_count?pretty" 
    curl -H "Content-Type: application/json" -X POST "$url" -d "$post"
}

function es.match
{
    # usage: es.match name:john position:architect
    query=""
    for q in "$@"
    do
      quoted=$(echo "$q" | sed -r "s/([^:]+)/\"\\1\"/g")
      query="$query, {\"match\":{$quoted}}"
    done

    query=$(echo $query | sed -e "s/^,//g")
    
    post='{"query": { "bool":{"must":['"$query"']}}}'
    url="localhost:9200/_search?pretty" 
    curl -H "Content-Type: application/json" -X POST "$url" -d "$post"
}

alias es.clean="curl -XDELETE 'localhost:9200/*?pretty'"
alias es.list="curl -X GET 'localhost:9200/_cat/indices?pretty'"
alias es.info="curl -X GET 'localhost:9200'"
alias es.health="curl -XGET 'localhost:9200/_cluster/health?pretty'"

# git aliases
alias git.cache="git config credential.helper 'cache --timeout=3000000'"
alias st="git status -s"
