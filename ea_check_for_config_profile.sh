#!/bin/bash
# v1 from opragel
# v1.1 matthewbodaly
# found another version on jamfnation that had a different version of getting the UUID
CONFIGURATION_PROFILE_UUID="43EA456A-C3F4-42F8-B752-E285385D0838"
computerConfigProfiles=$(profiles -Lv | grep "name: $4" -4 | awk -F": " '/attribute: profileIdentifier/{print $NF}')
if [[ "$computerConfigProfiles" == *$CONFIGURATION_PROFILE_UUID* ]]; then
    configCheckResult='T'
else
    configCheckResult='F'
fi
printf "<result>%s</result>" "$configCheckResult"
