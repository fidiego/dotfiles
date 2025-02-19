# system stuff aliases

alias ....='cd ../../.. '
alias ...='cd ../.. '
alias ..='cd .. '
# eza: alias ls w/ flags
alias ls="eza --icons"

alias allusers='cut -d: -f1 /etc/passwd'
alias clear=' clear '
alias c=' clear '
alias cl=' clear && ls -A'
alias cll=' clear && ls -lA'
alias la='ls -A'
alias ll='ls -lA'
alias lt='ls -Alth'
alias ltr='ls -Altrh'

# git
alias branch='git rev-parse --abbrev-ref HEAD | echo -n'
alias g='git '

# python
alias python='/usr/local/bin/python3.12'
alias pyserve='python -m http.server'
alias wenv='source /usr/local/bin/virtualenvwrapper.sh'
alias qr='~/.venvs/qr/bin/python ~/code/qr/qr.py'
alias uuid='python3 -c "import uuid, sys; sys.stdout.write(str(uuid.uuid4()))"'

alias rmswp='rm -i `find . | grep .swp$`'   # to remove stray swapfiles

# OSX
alias beep='tput bel'
alias chrome='open -a "Google Chrome" '
alias cpwd='pwd | pbcopy'


# utils
alias code="clear && cd ~/code && figlet 'fd.code' | lolcat"
#
# Zellij
#
# we have functions here to wrap certain commands we care about in zellij.
# these commands we want to run in a zellij window with `zellij run ...` so
# what we want to do is run the command with zellij run and pass all the args

alias zj='zellij'

_gopass() {
if [[ -z "${ZELLIJ}" ]]; then
  gopass "$@"
elif [[ "$1" == "show" ]]; then
  zellij run -f -c -- gopass "$@"
fi
}
alias gopass="_gopass "


#
# Github Functions
#
alias gitrmmerged='  git branch --merged | egrep -v "master|main" | xargs git branch -d'

#
# cd with reminder
#

# reminder_cd() {
#     builtin cd "$@" && { [ ! -f .cd-reminder ] || cat .cd-reminder 1>&2; }
# }

# alias cd=reminder_cd


alias tf="terraform "
alias tftr="TF_LOG=TRACE terraform "
alias tfdb="TF_LOG=DEBUG terraform "


## log printer

lugger() {
  while read -r line; do
    local first_ch=`printf "%.2s" "$line"`
    if [ "$first_ch" = "{\"" ]; then
      # TODO: escape newlines
      newline=`echo -n $line | perl -pe's/[\x00-\x1F]/ sprintf "\\u%04X", ord $& /eg'`
      (jq --color-output --sort-keys <<< $newline || jq -R '. as $line | try (fromjson) catch $line' <<< $newline ) || echo '::> '$line
    else
      echo $line
    fi
  done
  echo "\n::> Lugger is Done <::\n"
}


alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias ghostty="/Applications/Ghostty.app/Contents/MacOS/ghostty"

# used like this: `git co -b branch-name-`timestamp`
alias timestamp="date -Iminutes | sed 's/://g' | sed 's/-//g'"
