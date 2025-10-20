# zellij completions
source ~/.dotfiles/zellij-completions.sh

# homebrew completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# bun completions
# [ -s "/Users/fd/.bun/_bun" ] && source "/Users/fd/.bun/_bun"

# # fzf completions
# source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# nuon
# source <(nuon completion zsh)
