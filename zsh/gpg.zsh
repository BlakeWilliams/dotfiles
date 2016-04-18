#!/usr/bin/env zsh

ps -fu `whoami` | grep gpg-agent | grep -v grep > /dev/null
running=$?

if [ $running != 0 ]; then
  gpg-agent --daemon --write-env-file ~/.gpg-agent-info > /dev/null
fi

source ~/.gpg-agent-info
export GPG_AGENT_INFO
export GPG_TTY=`tty`
