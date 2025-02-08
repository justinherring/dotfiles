#!/bin/bash

# TODO: high priority: convert to powershell

# I started with this link
# https://stackoverflow.com/questions/57580420/wsl-using-a-wsl-symlink-folder-from-windows

# TODO: diff function

# TODO: symlink function

# TODO: generic replace function
# if they're different, confirm.
# backup existing files (mv file file-date.old) if they're different just in case anyway?

# TODO: put it all together
# symlink dotfiles/git-bash to ~
# symlink vscode to $env:APPDATA\Code\User\...

# Run as administrator
# New-Item -ItemType SymbolicLink -Path $env:APPDATA\Code\User\snippets -Target $env:USERPROFILE\dotfiles\vscode\snippets