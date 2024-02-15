echo "zshenv"

export PATH="${HOME}/.local/bin:${PATH}"

# golang
export GOPATH="${HOME}/.local/go"
export PATH="${GOPATH}/bin:${PATH}"

# rustup
. "$HOME/.cargo/env"
