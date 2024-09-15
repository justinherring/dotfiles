#!/bin/bash

# get dimensions of the screen
function dims() {
    echo -n "$(tput cols)x$(tput lines)"
}
export -f dims

# count how many lines are in a folder
function lines() {
    start_dir=${1:-.}
    find "$start_dir" -type f | sed 's/.*/"&"/' | xargs wc -l | sort -nr
}
export -f lines

# get the scripts section of package.json
function npms() {
    local path
    path="$(find . -maxdepth 2 -type f -iname 'package.json')"

    if [ ! -z "$path" ]; then
        echo "Found package.json: $path"
        jq \
            '.scripts | to_entries[] | "\(.key): \(.value)"' \
            --monochrome-output \
            --raw-output \
            "$path"
    else
        echo "Could not find package.json within 2 levels of directories"
        return 1
    fi
}
export -f npms

# count the number of tests in a dotnet project (n for number)
function dtn() {
    local tmpfile
    tmpfile=$(mktemp)

    dotnet test --list-tests --nologo --verbosity quiet | tee "$tmpfile"

    local header=4
    local lines
    lines=$(wc -l <  "$tmpfile")
    local count=$((lines - header))
    echo "Total tests: $count"

    rm "$tmpfile"
}
export -f dtn

# strip \r and \n and format JSON
function strip_json () {
	echo -n "$1" | sed -e 's/\\r//g' -e 's/\\n//g' -e 's/\\//g' -e 's/'.*'/&/' | jq '.'
}
export strip_json

# url-encode a string
function urlencode() { 
    python -c 'import urllib.parse; import sys; print(urllib.parse.quote(sys.argv[1], safe=""))' "$1";
}
export -f urlencode

# repeat a command (use: repeat 10 echo foo)
function repeat () { 
    local count="$1" i;
    shift;
    for i in $(seq 1 "$count");
    do
        eval "$@";
    done
}
export -f repeat

