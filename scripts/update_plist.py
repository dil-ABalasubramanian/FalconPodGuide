import plistlib
import os
import sys

# Path to Info.plist file
info_plist_path = os.getenv("INFO_PLIST_PATH", "../Example/FalconPodGuide/Info.plist")

# Increment Version and Build
def increment_version_and_build(plist_path):
    with open(plist_path, "rb") as plist_file:
        plist = plistlib.load(plist_file)

    # Get current version and build
    current_version = plist.get("CFBundleShortVersionString", "0.0.0")
    current_build = plist.get("CFBundleVersion", "0")

    # Increment version and build
    version_parts = list(map(int, current_version.split(".")))
    if len(version_parts) < 3:
        version_parts = [0, 0, 0]
    version_parts[2] += 1  # Increment patch version

    new_version = ".".join(map(str, version_parts))
    new_build = int(current_build) + 1

    # Update plist
    plist["CFBundleShortVersionString"] = new_version
    plist["CFBundleVersion"] = str(new_build)

    # Save updated Info.plist
    with open(plist_path, "wb") as plist_file:
        plistlib.dump(plist, plist_file)

    print(f"Updated Info.plist: Version = {new_version}, Build = {new_build}")

if __name__ == "__main__":
    if not os.path.exists(info_plist_path):
        print(f"Error: Info.plist not found at {info_plist_path}")
        sys.exit(1)

    increment_version_and_build(info_plist_path)
