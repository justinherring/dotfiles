# overrides
alias diff="diff -y --color -W $(tput cols)"
alias less="less -F"
alias mkdir="mkdir -pv"

# files
alias fe="explorer.exe"
alias ff="find"
alias ttcsv="sed 's/\t/,/g; s/,$//'" # quick and very dirty way to convert TSV to CSV

# time
alias now="date -R"
alias nowu="date -u -R"
alias nowb="now; nowu"

# .NET
alias dr="dotnet run"
alias db="dotnet build"
alias dt="dotnet test --nologo -l 'console;verbosity=normal'"
alias dtf="dt --filter"
alias dtc="dotnet_cover.sh"

# Node
alias nr="npm run serve"
alias nrtc="npm run type-check"
alias npm-check="npx npm-check -u"

# API helpers
alias status="curl -s -o /dev/null -w \"%{http_code}\""
alias response_size="curl -so /dev/null -w '%{size_download}'"

