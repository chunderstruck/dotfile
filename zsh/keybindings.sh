# Edit and rerun
    function edit_and_run() {
        BUFFER="fc"
        zle accept-line
    }
    zle -N edit_and_run
    bindkey "^v" edit_and_run

# Add SUDO
    function add_sudo() {
        BUFFER="sudo "$BUFFER
        zle end-of-line
    }
    zle -N add_sudo
    bindkey "^s" add_sudo

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1
