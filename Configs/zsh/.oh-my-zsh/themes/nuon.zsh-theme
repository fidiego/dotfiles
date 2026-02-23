#!/usr/bin/env zsh

# Nuon brand colors (from pkg/cli/styles/colors.go, dark palette)
PR_RESET="%{$reset_color%}"
PR_PRIMARY="%{$(tput setaf 183)%}"      # #D6B0FC - primary (light purple)
PR_SECONDARY="%{$(tput setaf 111)%}"    # #99B7FF - secondary (blue)
PR_ACCENT="%{$(tput setaf 99)%}"        # #8040BF - accent (deep purple)
PR_SUBTLE="%{$(tput setaf 249)%}"       # #B9B9B9 - subtle (grey)
PR_SUCCESS="%{$(tput setaf 80)%}"       # #5BBFB5 - success (teal)
PR_WARNING="%{$(tput setaf 223)%}"      # #FFBD7F - warning (orange)
PR_ERROR="%{$(tput setaf 210)%}"        # #FF8383 - error (red)
PR_INFO="%{$(tput setaf 69)%}"          # #527FE8 - info (blue)

# ########## GIT ###########
ZSH_THEME_GIT_PROMPT_PREFIX="${PR_RESET}${PR_SECONDARY}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${PR_RESET}"
ZSH_THEME_GIT_PROMPT_DIRTY=" ${PR_WARNING}✘${PR_RESET}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ${PR_SUCCESS}✔${PR_RESET}"
# ########## GIT ###########

# Context: user@directory or just directory
prompt_context () {
    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
        echo -n "${PR_SUCCESS}$USER${PR_RESET}@${PR_INFO}%m${PR_RESET} %~% ${PR_RESET}"
    else
        echo -n "${PR_PRIMARY} %~% ${PR_RESET}"
    fi
}

set_prompt () {
    setopt prompt_subst
    autoload zsh/terminfo

    PROMPT='${PR_SUBTLE}%D{%Y-%m-%d}${PR_RESET} :: ${PR_SUBTLE}%*${PR_RESET} $(git_prompt_info)
$(prompt_context)
${PR_ACCENT}:>${PR_RESET} '
    RPROMPT=''
}

set_prompt
