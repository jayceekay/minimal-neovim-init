# vim: ft=bash

#!/bin/zsh
NVIM_LISTEN_ADDRESS=/tmp/nvimsocket XDG_CACHE_HOME=./cache XDG_CONFIG_HOME=./config XDG_DATA_HOME=./data nvim -u ./init.lua
