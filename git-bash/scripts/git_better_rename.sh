#!/bin/bash

# renamex2 is intended for when you rename a file, and git doesn't track the
# rename, so it re-renames the file to the old name, and then uses `git mv` to
# rename the file to the desired new name.
#
# A helpful pattern I was using was to use `git status`, copy the first name
# from the untracked files section (assuming they're all renamed files),
# then type `renamex2 <new_name>`, and then copy the first `deleted` file from
# `git status`, and then paste it. The function calls `git status` after it's
# finished to facilitate this pattern.
function renamex2() {
    # TODO: validate arguments
    # TODO: add dry run?
    # TODO: allow multiple file renames in one call
    local new_name=$1
    local old_name=$2

    # TODO: add error handling
    mv "$new_name" "$old_name"
    git mv "$old_name" "$new_name" 
    git status
}
export -f renamex2

