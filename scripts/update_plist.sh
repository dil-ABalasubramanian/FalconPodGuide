#!/bin/bash

# Ensure the script exits on error
set -e

# Path to Info.plist
INFO_PLIST=$(find ../Example/FalconPodGuide -name "Info.plist" | head -n 1)
echo "path = $INFO_PLIST"

# Get current version and build
CURRENT_VERSION=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "$INFO_PLIST" 2>/dev/null || echo "0.0.0")
CURRENT_BUILD=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$INFO_PLIST" 2>/dev/null || echo "0")

# Increment version (e.g., patch version)
IFS='.' read -r MAJOR MINOR PATCH <<< "${CURRENT_VERSION:-0.0.0}"
PATCH=$((PATCH + 1))
NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}"

# Increment build number
NEW_BUILD=$((CURRENT_BUILD + 1))

# Update Info.plist with new version and build
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $NEW_VERSION" "$INFO_PLIST"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $NEW_BUILD" "$INFO_PLIST"

echo "Updated Info.plist: Version = $NEW_VERSION, Build = $NEW_BUILD"
