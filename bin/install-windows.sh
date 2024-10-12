#!/bin/bash

# TODO: convert to powershell at some point?

# I started with this link
# https://stackoverflow.com/questions/57580420/wsl-using-a-wsl-symlink-folder-from-windows

# Run as administrator
# New-Item -ItemType SymbolicLink -Path $env:APPDATA\Code\User\snippets -Target $env:USERPROFILE\dotfiles\windows\snippets