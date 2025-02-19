# system stuff aliases
alias ...='cd ../.. '
alias ..='cd .. '
alias allusers='cut -d: -f1 /etc/passwd'
alias c='clear '
alias cl='clear && ls -A'
alias cll='clear && ls -lA'
alias la='ls -A'
alias ll='ls -lA'
alias lt='ls -Alth'
alias ltr='ls -Altrh'

# git
alias gtst='git status '
alias gtdf='git diff '
alias branch='git rev-parse --abbrev-ref HEAD'

# python
alias pyserve='python -m SimpleHTTPServer '
alias pyserve3='python -m http.server'
alias wenv='source /usr/local/bin/virtualenvwrapper.sh'

# vim
alias mvim='mvim -v '                       # open mvim in visual mode OSX
alias rmswp='rm -i `find . | grep .swp$`'   # to remove stray swapfiles

# OSX
alias beep='tput bel'
alias chrome='open -a "Google Chrome" '
alias cpwd='pwd | pbcopy'
