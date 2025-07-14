#!/usr/bin/env bash
if [[ -o interactive && ! -f /tmp/.motd_seen ]]; then
  echo -e "\e[42mMotd:\e[0m"
  curl https://api.quotable.io/random -s | jq -r '"\(.content)\n - \(.author)"'

  touch /tmp/.motd_seen
fi
