export TERM="xterm-256color"

source  ~/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir vcs )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()


#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Set default text editor
export EDITOR='vim'

# Update homebrew once a week
export HOMEBREW_AUTO_UPDATE_SECS=60000

DEFAULT_USER=$USER

# Python Configuration (Because Python3 is REAL:tm: Python)
alias python=python3
alias pip=pip3source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

# https://www.viget.com/articles/zsh-config-productivity-plugins-for-mac-oss-default-shell/
# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# add this configuration to ~/.zshrc
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HISTSIZE=1000000
export SAVEHIST=1000000


#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source ~/.iterm2_shell_integration.zsh

########################################################################################################################
# Zplug
########################################################################################################################

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update 
fi

source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'


HIST_STAMPS="mm/dd/yyyy" # variable used in oh-my-zsh/lib/history.zsh
zplug "robbyrussell/oh-my-zsh", use:"lib/{clipboard,completion,directories,history,termsupport,key-bindings}.zsh"

zplug "zplug/zplug"
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxexexabagacad
#export LS_COLORS=gxfxcxdxbxexexabagacad

export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
alias history='fc -il 1'
alias unzipme='/Users/daniel.chun/tools/unzipme.sh'
alias xpath_generate.py=python2 xpath_generate.py
