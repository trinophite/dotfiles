export PATH="/opt/homebrew/bin:$PATH"
export PATH="${HOME}/.local/bin:${PATH}"

# golang
export GOPATH="${HOME}/.local/go"
export PATH="${GOPATH}/bin:${PATH}"

# rustup
. "$HOME/.cargo/env"

# fzf theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
