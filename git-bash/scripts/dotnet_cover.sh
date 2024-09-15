#!/bin/bash -e

local now
now="$(date +%Y-%m-%d-%H-%M-%S)"
local outfile="TestResults/results-$now.log"
dotnet test \
	--nologo \
	-l 'console;verbosity=normal' \
	"$@" \
	--results-directory="./TestResults" \
	--collect:"XPlat Code Coverage" \
	-- DataCollectionRunSettings.DataCollectors.DataCollector.Configuration.ExcludeByFile="**/Migrations/**/*" \
	| tee "$outfile"

reportlocation=$(tail -n 1 "$outfile" | sed 's/^[[:space:]]*//')
reportgenerator \
	-reports:"$reportlocation" \
	-targetdir:"TestResults/coveragereport" \
	-reporttypes:Html \
	-historydir:"TestResults/coveragehistory"

start TestResults/coveragereport/index.html
