[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return
# Path to your oh-my-zsh installation.
export ZSH=/home/samis/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
plugins=(gitignore git-extras colored-man-pages extract safe-paste zsh-autosuggestions zsh-syntax-highlighting)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nano'
else
    export EDITOR='emacsclient'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='green'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="white"
POWERLEVEL9K_HISTORY_BACKGROUND='238'
export ALTERNATE_EDITOR=""
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
alias emacs=emacsclient
alias nano=emacs
#source ~/.xsh
#source /etc/profile.d/emscripten.sh
alias ls="ls --color=auto"
alias in-dotfiles='() {( cd ~/dotfiles; $@)} '
alias ind=in-dotfiles
# gpg-agent, done right.
eval $(gpg-agent --daemon --enable-ssh-support)
# GNUstep application root
export GNUSTEP_USER_ROOT="${HOME}/GNUstep"
alias xmlpp"=xmllint --format"
# Add to the path variable named by $1 the component $2.  $3 must be
# "append" or "prepend" to indicate where the component is added.
addpath () {
    eval value=\"\$$1\"
    case "$value" in
        *:$2:*|*:$2|$2:*|$2)
            result="$value"
            ;;
        "")
            export $1
            result="$2"
            ;;
        *)
            case "$3" in
                p*)
                    result="$2:${value}"
                    ;;
                *)
                    result="${value}:$2"
                    ;;
            esac
    esac
    eval $1=$result
    unset result value
}

# convenience routine which appends a string to a path.
append () {
    addpath "$1" "$2" append
}

# convenience routine which prepends a string to a path.
prepend () {
    addpath "$1" "$2" prepend
}
[ -f ".guix-profile/etc/profile" ] && source .guix-profile/etc/profile
append PATH /home/samis/.gem/ruby/2.1.0/bin
prepend PATH /home/samis/bin
prepend PATH /home/samis/.cabal/bin/
export XDG_CACHE_HOME="/home/samis/tmp/cache"
export XDG_CONFIG_HOME="/home/samis/etc"
export XDG_DATA_HOME="/home/samis/share/"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

PATH="/home/samis/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/samis/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/samis/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/samis/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/samis/perl5"; export PERL_MM_OPT;
