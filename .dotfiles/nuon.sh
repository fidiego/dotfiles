#!/bin/bash

# find a better place for these
export AWS_REGION=us-west-2
export AWS_PROFILE=stage.NuonAdmin

# nuon dev things
export NUON_ROOT="/Users/fd/nuon/mono"
export NUON_DISABLE_TELEMETRY="true"
export NUON_API_TOKEN_DEV=`cat ~/.seed.yml | grep token | cut -d ' ' -f 2`
export NUON_API_TOKEN_STAGE=`cat ~/.stage  | grep token | cut -d ' ' -f 2`

# alias for mono repo
alias mono="cd ~/nuon/mono && clear && figlet 'Nuon Mono' | lolcat"
alias runner="cd ~/nuon/nuon-runner-go && clear && figlet 'Nuon Runner' | lolcat"
# alias nuondev="nuon -f ~/.seed.yml "  # superceded by nb
# alias ns="nuon -f ~/.stage "

#
# Functions
#

# good morning: sso login
function gmnuon() {
  reset="$1"
  mono

  figlet -f cybermedium "Init AWS" | lolcat
  nuonctl scripts exec init-aws

  figlet -f cybermedium "Init Kubeconfig" | lolcat
  nuonctl scripts exec init-kubeconfig

  figlet -f cybermedium "go mod download" | lolcat
  go mod download

  if [ "$reset" = "--reset-gen" ]; then
    figlet -f cybermedium "Resetting Generated Code" | lolcat
    nuonctl scripts exec reset-generated-code
  fi
}

# compile and run nounctl
function nctl () {
        cd ~/nuon/mono/bins/nuonctl
        time go build -o /tmp/nctl .
        cd - > /dev/null
        /tmp/nctl "$@"
}

# get token for env
function nuontoken() {
  env="${1:-dev}"
  seedfile=~/.seed.yml
  if [[ $env == 'dev' ]]; then
    seedfile=~/.seed.yml
  elif [[ $env == 'stage' ]]; then
    seedfile=~/.stage
  elif [[ $env == 'prod' ]]; then
    seedfile=~/.nuon
  fi
  token=`cat $seedfile | grep token | cut -d ' ' -f 2`
  echo -n $token
}

# compile and run nuon
function nb () {
        cd ~/nuon/mono/bins/cli
        go build -o /tmp/nb .
        cd - > /dev/null
        /tmp/nb -f ~/.seed.yml "$@"
}

# compile and run nuon w/ stage
function ns () {
        cd ~/nuon/mono/bins/cli
        go build -o /tmp/nb .
        cd - > /dev/null
        /tmp/nb -f ~/.stage "$@"
}

# function noun_env()
# {
#   echo
#   echo "settinge env vars from seed file: "$1
#   echo
#   seed_file = '~/.'$1'.yml'
#   nuon_api_token = $(cat $seed_file | grep "api_token" |  cut -d ' ' -f 2)
#   nuon_org = $(cat $seed_file | grep org | cut -d ' ' -f 2)
# }
#
