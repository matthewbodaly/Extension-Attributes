#!/bin/bash
# I could probably do it this way with a little time
# https://jamfnation.jamfsoftware.com/discussion.html?id=19323
installAtLogoutItems=$(defaults read /Library/Updates/index.plist InstallAtLogout)
printf '<result>'
if [ ${#installAtLogoutItems} -le 3 ]; then
  printf  'No updates pending'
else
  printf "%s" "${installAtLogoutItems:1:${#installAtLogoutItems}--2}"
fi
printf '</result>'
