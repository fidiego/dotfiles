# Ghostty shell integration for zsh. This should be at the top of your zshrc!
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.zsh"
fi
