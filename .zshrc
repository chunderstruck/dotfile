# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# add this configuration to ~/.zshrc
# HISTORY CONFIGURATION
export HISTFILE=~/dotfiles/zsh/zsh_history/.zsh_history  # ensure history file visibility
export HISTSIZE=1000000
export SAVEHIST=1000000

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source ~/.iterm2_shell_integration.zsh

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxexexabagacad
#export LS_COLORS=gxfxcxdxbxexexabagacad

export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Set default text editor
export EDITOR='vim'

# Update homebrew once a week
export HOMEBREW_AUTO_UPDATE_SECS=60000

DEFAULT_USER=$USER

# Python Configuration (Because Python3 is REAL:tm: Python)
alias python=python3
#alias pip=pip3source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#alias pip=pip3source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


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
#zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
alias history='fc -il 1'


alias xpath_generate.py='python2 xpath_generate.py'
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom CD
chpwd() ls

source ~/dotfiles/alias.sh
source ~/dotfiles/zsh/keybindings.sh
[[ ! -f ~/dotfiles/local.sh ]] || source ~/dotfiles/local.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"

# VIM MODE
# http://stratus3d.com/blog/2017/10/26/better-vi-mode-in-zshell/
# http://coryklein.com/vi/2015/09/17/a-working-vi-mode-indicator-in-zsh.html
# https://dougblack.io/words/zsh-vi-mode.html
source ~/dotfiles/zsh/shelllog.sh
