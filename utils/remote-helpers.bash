
# Helpers for the following setup:
# Working from a local machine (e.g. MacOS) via ssh to a remote server (e.g. Ubuntu 22)
# Using vscode remote

vscode-server

function clean_all_vscode_servers {
   # Motivation: After a while, there will be many of them

   # Step 1: See evidence
   ps aux |grep "vscode-server"
ß}
