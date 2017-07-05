#!/bin/bash
# v1 Matthew Bodaly - June 2017
# This gets the current version of MAU for use when getting office silently updated.
# There's probably a better way to do this.
Version=`defaults read /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/Info CFBundleVersion`
echo "<result>"$Version"</result>"
