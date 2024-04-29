#!/bin/bash
set -exu

# Helpers for the following setup:
# Working from a local machine (e.g. MacOS) via ssh to a remote server (e.g. Ubuntu 22)
# Using vscode remote

# Enable colour when grep-ing inside the script
# alias grep='grep --color=auto'
source ~/.bashrc

function id_from_psaux {
   # Usage: pipe with a `ps aux`
   cut -c10-16
}
export -f id_from_psaux


# ps aux | sort -rnk +3

# Usage:
#

function clean_all_vscode_servers {
   # Motivation: After a while, there will be many of them

   # Step 1: See evidence
   ps aux | grep --color=auto "vscode-server"
   ps aux | grep  "vscode-server" | id_from_psaux
   # ps aux | grep "vscode-server" | id_from_psaux | xargs kill

}

export -f clean_all_vscode_servers

# example
clean_all_vscode_servers
