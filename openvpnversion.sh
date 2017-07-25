#!/bin/bash
# Get the installed version of OpenVPN. Why the version is here instead of in the normal place.... whatever.
# File goes in. File goes out.
# Matthew Bodaly - v1.0 - July 2017
version=`more /Library/Frameworks/OpenVPN.framework/Versions/Current/Resources/version.txt`

    echo "<result>$version</result>"

exit 0
