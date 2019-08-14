# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zgen plugin manager for zsh
# load zgen
source ".zgen/zgen.zsh"
# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen load zsh-users/zsh-syntax-highlightin
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

  # generate the init script from plugins above
  zgen save
fi

# bsdtar locale error fix
export  LANG=en_US.UTF-8

export LANG=en_US.UTF-8
export LC_MESSAGES="C"
# fzf options
# CTRL-T: automaticly selects if only 1 uitem. quits if 0
export FZF_CTRL_T_OPTS="--select-1 --exit-0"
# ALT-c tree command to get entries from dirs
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
# editor vim
export VISUAL=vim
export EDITOR="$VISUAL"
export TERMINAL=termite

LC_CTYPE="en_US.UTF-8"
# .bashrc config
alias update='sudo pacmatic -Syu'
alias clock='tty-clock -c '
alias ls='ls --color=auto'
alias ll='ls -l'
# virtualenv
alias venv='source ~/.virtualenvs/abapong/bin/activate'
# the fuck
eval $(thefuck --alias)
# cd into dir when closing ranger
alias ranger='ranger-cd'
alias cc='pushd'
alias dirs="dirs -v"
alias v='vim'
alias todo='topydo columns'
alias wall='QuickWall'



# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
BULLETTRAIN_PROMPT_SEPERATE_LINE=true
BULLETTRAIN_PROMPT_ADD_NEWLINE=true
BULLETTRAIN_PROMPT_ORDER=(
	status
	custom
	context
	dir
	screen
	perl
	ruby
	virtualenv
	aws
	go
	rust
	elixir
	git
	hg
)
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
#

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

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

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#This is based on: https://github.com/ranger/ranger/blob/master/examples/bash_automatic_cd.sh
#Paste this into your .zshrc:

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}


bindkey -s '^O' 'ranger-cd\n'
#ranger-cd will fire for Ctrl+O

source $ZSH/oh-my-zsh.sh


cd ~/


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
