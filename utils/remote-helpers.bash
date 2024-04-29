#!/bin/bash
set -exu

# Helpers for the following setup: (remote development environment)
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


function cleanup_sshagents {

   # Get all ssh-agent process IDs "except for" the most recently started one
   ssh_agents=$(pgrep -f ssh-agent | sort | head -n -1)

   # Kill all other ssh-agent processes
   for pid in $ssh_agents; do
      echo "Killing ssh-agent with PID $pid"
      kill $pid
   done

   # Optional: To list remaining ssh-agent process
   echo "Remaining ssh-agent processes:"
   pgrep -fl ssh-agent

   echo "If you killed too many ssh-agents: To revive the ssh connection to github:"
   echo 'eval "$(ssh-agent -s)"'
   echo 'ssh-add ~/.ssh/github_rsa'
}
cleanup_sshagents
