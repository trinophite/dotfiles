echo "zshrc"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/opt/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/opt/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# aliases
# eza
if command -v eza > /dev/null; then
    alias ls='eza --icons'
    alias ll='ls -l'
fi

# git
alias gst='git status'
alias gc='git commit'
alias gaa='git add -A'

# kubenetes cli
if command -v kubectl > /dev/null; then
    alias k='kubectl'
fi

# neovim
if command -v nvim > /dev/null; then
    alias vim='nvim'
    alias vi='nvim'
    alias v='nvim'
    export EDITOR=nvim
fi

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
