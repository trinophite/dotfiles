# >>> conda initialize >>>
CONDA_HOME="${HOME}/.local/miniforge3"
__conda_setup="$(${CONDA_HOME}/bin/conda 'shell.zsh' 'hook' 2> /dev/null)"

if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${CONDA_HOME}/etc/profile.d/conda.sh" ]; then
        . "${CONDA_HOME}/etc/profile.d/conda.sh"
    else
        export PATH="${CONDA_HOME}/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "${CONDA_HOME}/etc/profile.d/mamba.sh" ]; then
    . "${CONDA_HOME}/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

############################################################################
# aliases

# ls
if command -v eza > /dev/null; then
    alias ls='eza --icons'
    alias ll='ls -la'
    alias l='ls -l'
fi

# editor
if command -v nvim > /dev/null; then
    alias vim='nvim'
    alias vi='nvim'
    alias v='nvim'
    export EDITOR=nvim
fi

# better history search using arrow keys
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit load zdharma-continuum/history-search-multi-word

zinit light unixorn/fzf-zsh-plugin

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

zinit snippet https://github.com/ohmyzsh/ohmyzsh/raw/master/plugins/kubectl/kubectl.plugin.zsh
zinit snippet https://github.com/ohmyzsh/ohmyzsh/raw/master/plugins/git/git.plugin.zsh
zinit snippet https://github.com/ohmyzsh/ohmyzsh/raw/master/plugins/extract/extract.plugin.zsh

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
