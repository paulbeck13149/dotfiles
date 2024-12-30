# Configures Zsh shell behavior, prompts, and interactive features

# Start X automatically on TTY1
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx "$XINITRC"
fi

# Basic auto/tab complete
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
zstyle ':completion:*' menu select
zmodload zsh/complist

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# Basic key bindings
bindkey '^?' backward-delete-char
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^r' history-incremental-search-backward

# History settings - using XDG dirs from profile
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME

# Auto-cd
setopt auto_cd
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Source shell-independent aliases
[ -f "$XDG_CONFIG_HOME/shell/aliases" ] && source "$XDG_CONFIG_HOME/shell/aliases"

# Basic prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' [%b]'
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f${vcs_info_msg_0_}$ '

# Lazy load nvm - using XDG dirs from profile
if [ -s "$NVM_DIR/nvm.sh" ]; then
    nvm() {
        unset -f nvm
        # Load nvm
        [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
        # Load bash_completion
        [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
        # Call nvm with original arguments
        nvm "$@"
    }
fi

# Enable syntax highlighting (installed via pacman)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
