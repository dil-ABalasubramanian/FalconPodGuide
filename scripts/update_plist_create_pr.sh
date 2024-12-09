#!/bin/bash

# Ensure the script exits on error
set -e

# Set up variables
BASE_BRANCH="main" # Change this to your base branch
BRANCH_NAME="version-bump/$(date +'%Y%m%d%H%M%S')" # Unique branch name
INFO_PLIST=${INFO_PLIST_PATH:-"../Example/FalconPodGuide/Info.plist"}

if [ -z "$INFO_PLIST" ]; then
  echo "Error: Info.plist not found in the project."
  exit 1
fi

echo "Found Info.plist at: $INFO_PLIST"

# Get current version and build
CURRENT_VERSION=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "$INFO_PLIST" 2>/dev/null || echo "0.0.0")
CURRENT_BUILD=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$INFO_PLIST" 2>/dev/null || echo "0")

# Increment version and build
IFS='.' read -r MAJOR MINOR PATCH <<< "${CURRENT_VERSION:-0.0.0}"
PATCH=$((PATCH + 1))
NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}"
NEW_BUILD=$((CURRENT_BUILD + 1))

# Update Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $NEW_VERSION" "$INFO_PLIST"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $NEW_BUILD" "$INFO_PLIST"

echo "Updated Info.plist: Version = $NEW_VERSION, Build = $NEW_BUILD"

# Commit and push changes
git checkout -b "$BRANCH_NAME"
git add "$INFO_PLIST"
git commit -m "Auto-incremented version to $NEW_VERSION and build to $NEW_BUILD"
git push --set-upstream origin "$BRANCH_NAME"

# Create a pull request using GitHub CLI
gh pr create --base "$BASE_BRANCH" --head "$BRANCH_NAME" --title "Version Bump to $NEW_VERSION" --body "Auto-incremented version to $NEW_VERSION and build number to $NEW_BUILD."
