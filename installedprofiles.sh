#!/bin/bash
# Show what profiles are installed on a computer for use with a smart group
# From https://www.jamf.com/jamf-nation/discussions/9334/extension-attribute-to-see-config-profile

profiles=`profiles -P -v | awk -F: '/attribute: name:/{print $NF}' | sed 's/\ //'`

    echo "<result>$profiles</result>"

exit 0
