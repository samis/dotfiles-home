#
# ~/.bashrc
#
#source ~/.profile
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/home/samis/.gem/ruby/2.2.0/bin:$PATH"

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# added by travis gem
[ -f /home/samis/.travis/travis.sh ] && source /home/samis/.travis/travis.sh

__OLD_PATH=$PATH
function updatePATHForNPM() {
  export PATH=$(npm bin):$__OLD_PATH
}

function node-mode() {
  unset NODE_ENV
  unset ATOM_SHELL_INTERNAL_RUN_AS_NODE
  PROMPT_COMMAND=updatePATHForNPM
}

function node-mode-off() {
  unset PROMPT_COMMAND
  PATH=$__OLD_PATH
}
source /usr/share/doc/pkgfile/command-not-found.bash
function dotedit() {
  cd ~/dotfiles/$1
}


source ~/.xsh

