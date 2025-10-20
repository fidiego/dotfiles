#!/bin/bash

# find a better place for these
export AWS_REGION=us-west-2
export AWS_PROFILE=stage.NuonAdmin

# nuon dev things
export NUON_ROOT="/Users/fd/nuon/mono"
export NUON_DISABLE_TELEMETRY="true"
export NUON_PREVIEW="true"

# alias for mono repo
alias mono="z ~/nuon/mono && clear && figlet 'Nuon Mono' | lolcat"
alias byoc="z ~/nuon/byoc && clear && figlet 'BYOC ~= Nuon' | lolcat"
alias demo="z ~/nuon/demo && clear && figlet 'demos' | lolcat"
alias nuon-go="z ~/nuon/nuon-go && clear && figlet 'nuon-go' | lolcat"
# alias nuondev="nuon -f ~/.seed.yml "  # superceded by nb
# alias ns="nuon -f ~/.stage "

#
# Functions
#

# good morning: sso login
function gmnuon() {
  arg="$1"
  if [ "$arg" = "--help" ]; then
    echo "gmnuon [--reset-gen] [--all] [--keep-db]"
  fi

  # echo "$@"
  # if [[ "$@" == "*--keep-db*" ]]; then
  #   keep_db="true"
  #   echo "will keep db"
  # else
  #   keep_db="false"
  #   echo "won't keep db"
  # fi

  set -u
  set -o pipefail
  set -e

  mono

  figlet -f cybermedium "Init AWS" | lolcat
  nuonctl scripts exec init-aws

  figlet -f cybermedium "Init Kubeconfig" | lolcat
  nuonctl scripts exec init-kubeconfig

  figlet -f cybermedium "go mod download" | lolcat
  go mod download

  if [ "$arg" = "--reset" ]; then
    figlet -f pepper "Resetting Podman VM" | lolcat
    nuonctl scripts exec reset-podman-vm

    figlet -f pepper "Resetting Dependencies" | lolcat
    nuonctl scripts exec reset-dependencies

    figlet -f pepper "Resetting Generated Code" | lolcat
    nuonctl scripts exec reset-generated-code
  fi
}

# compile and run nounctl
function nctl () {
        ~/nuon/mono/run-nuonctl.sh "$@"
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
        mv /tmp/nb /tmp/nb-bak
        cd ~/nuon/mono/bins/cli
        /usr/bin/time -a -o ~/.scratch/builds/nb/`date -Idate`.txt go build -o /tmp/nb .
        cd - > /dev/null
        /tmp/nb -f ~/.seed.yml "$@"
}

# compile and run nuon w/ stage
function ns () {
        cd ~/nuon/mono/bins/cli
        go build -o /tmp/ns .
        cd - > /dev/null
        /tmp/ns -f ~/.stage "$@"
}

function aws_creds() {
  path_to_file="$1"
  AWS_ACCESS_KEY_ID=`cat $path_to_file     | jq -r '.Credentials.AccessKeyId'`
  AWS_SECRET_ACCESS_KEY=`cat $path_to_file | jq -r '.Credentials.SecretAccessKey'`
  AWS_SESSION_TOKEN=`cat $path_to_file     | jq -r '.Credentials.SessionToken'`
  echo AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" AWS_SESSION_TOKEN="$AWS_SESSION_TOKEN"
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
#
export NGROK_AUTHTOKEN=32MXnLwZFMxxgLbkUHEjH_5q9R4AdLbzWA7Y14sNtdK
