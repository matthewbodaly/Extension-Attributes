#!/bin/bash
# v1 - Matthew Bodaly
# There's probably a better way to do this
# I need to know how many days ago an application was used to determine if its worth keeping on a computer.
# I started here: https://www.jamf.com/jamf-nation/feature-requests/3361/application-usage-searchable-by-application This got me the mdls key
# I also used : https://stackoverflow.com/questions/3385003/shell-script-to-get-difference-in-two-dates
# I also used : https://www.jamf.com/jamf-nation/discussions/18058/extension-attribute-to-report-when-an-application-was-lasted-opened for error reporting
# I also realize that I'm being pretty lame about getting the first epoch exact and the second rounded to the date so the numbers aren't todally exact.
# Usage is pretty straight forward. If the application is installed and has been used at all, there will be a number. If the application is not installed, or there is an error, that is currently set to 0.

## Enter the path to the application bundle to check on, including the .app extension
appPath="/Applications/Safari.app"
## Get todays date
TodaysDateEpoch=$(date +%s)
## Get the LastUsedDate as reported by mdls
appLastUsedDate=$(mdls "$appPath" -name kMDItemLastUsedDate | awk '{print $3}')
## Change the date to epoch
appLastUsedDateEpoch=$(date -j -f "%Y-%m-%d" "$appLastUsedDate" +"%s")

## Do error checking and maths
if [ ! -e "$appPath" ]; then
      result="0"
fi
if [ -e "$appPath" ]; then
      result=$((($TodaysDateEpoch-$appLastUsedDateEpoch)/(86400)))
fi
if [ "$result" == "" ]; then
    result="0"
fi
echo "<result>$result</result>"
