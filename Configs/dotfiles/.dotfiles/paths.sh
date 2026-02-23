PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/bin"

# homebrew
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# psql client
export PATH="$PATH:/usr/local/opt/libpq/bin"

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# golang
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# atuin
export PATH="$PATH:$HOME/.atuin/bin/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# psql: via brew
export PATH="$PATH:/opt/homebrew/opt/postgresql@17/bin/"
# export PATH="$PATH:/opt/homebrew/opt/postgresql@15/bin/"
