# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/nick/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails ruby asdf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Language environment — required for UTF-8/emoji in tmux/terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# brew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# aliases
alias c="clear"                                                  # clears the terminal
alias h="history"                                                # brings up history of terminal input
alias d="cd ~/Documents/personal-projects"            		 # go to the documents folder
alias notes="cd ~/Documents/personal-projects/notes"  		 # go to notes folder
alias wd="cd ~/Documents/wiki_data/"                                # go to wiki_data folder, to write wiki pages
alias tbg="cd ~/Documents/personal-projects/tbg"      		 # go to tbg folder
alias bccb="cd ~/Documents/personal-projects/backcountry_cookbook"	      		 # go to backcountry cookbook folder
alias sb="cd ~/Documents/personal-projects/scavengers-breakfast" # go to scavengers breakfast folder 
alias os="overmind s"						 # shortcut for overmind start
alias oc="overmind connect"				         # shortcut for overmind connect
alias git-yesterday='git --no-pager log --pretty="- %s. %b" --author=nickagliano@gmail.com --since=1.day.ago --all --no-merges --reverse'
alias git-today='git --no-pager log --pretty="- %s. %b" --author=nickagliano@gmail.com --since=midnight --all --no-merges --reverse'
alias gco='git checkout $(git branch --sort=-committerdate | fzf)'
alias gp='git push'
alias gcm='git commit -m'
alias tt="cd ~/Documents/personal-projects/tech_talker && ./run.sh"


# postgres custom vars
export PGDATA='/usr/local/var/postgres'
export PGHOST=localhost
alias start-pg='pg_ctl -l $PGDATA/server.log start'
alias stop-pg='pg_ctl stop -m fast'
alias show-pg-status='pg_ctl status'
alias restart-pg='pg_ctl reload'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias config='/usr/bin/git --git-dir=/Users/nick/.cfg/ --work-tree=/Users/nick'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


# JINA_CLI_BEGIN

## autocomplete
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jina jina

_jina() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(jina commands)"
  else
    completions="$(jina completions ${words[2,-2]})"
  fi

  reply=(${(ps:
:)completions})
}

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# JINA_CLI_END


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nick/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nick/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/nick/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nick/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/nick/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/nick/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


export OPENROUTER_API_KEY=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
export EPM_PUBLISH_TOKEN=ba5c3ab18d590a46932b2e3d93f714fecefd48581b6732a315aa3779dda4820c

. "$HOME/.cargo/env"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/Users/nick/Documents/personal-projects/epc/target/release:$PATH"
export PATH="/Users/nick/Documents/personal-projects/extremely_personal_marketplace/target/release:$PATH"

# vibesesh — mobile tmux session manager
source "$HOME/.vibesesh/shell.zsh"
