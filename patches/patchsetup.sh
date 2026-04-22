#!/bin/bash
# Custom patch script - OrangeFox
# by: @dantepaulxd (2026)
set -e  # stop on error

echo "== OrangeFox Custom Patch Script =="

# Use ORANGEFOX_PATH environment variable, or fallback to /opt/fox_12.1
ORANGEFOX_PATH="${ORANGEFOX_PATH:-/opt/fox_12.1}"

# Get the DEVICE_PATH from environment or use as argument
DEVICE_PATH="${DEVICE_PATH:-$1}"

if [ -z "$DEVICE_PATH" ]; then
    echo " Error: DEVICE_PATH not set and no argument provided"
    exit 1
fi

PATCHES_DIR="$ORANGEFOX_PATH/${DEVICE_PATH}/patches"
SOURCE_DIR="$ORANGEFOX_PATH/bootable/recovery"

# --- Safety checks ---
if [ ! -d "$PATCHES_DIR" ]; then
    echo " Patch directory not found: $PATCHES_DIR"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo " Source directory not found: $SOURCE_DIR"
    exit 1
fi

echo " Patch dir: $PATCHES_DIR"
echo " Source dir: $SOURCE_DIR"

# --- Helper function ---
copy_patch() {
    local src="$1"
    local dest="$2"
    if [ ! -f "$src" ]; then
        echo " Missing patch file: $src"
        exit 1
    fi
    if [ ! -d "$(dirname "$dest")" ]; then
        echo " Destination path missing: $(dirname "$dest")"
        exit 1
    fi
    echo "→ Patching: $(basename "$src")"
    cp -f "$src" "$dest"
}

# --- Apply patches ---
copy_patch "$PATCHES_DIR/maintainer.png" \
"$SOURCE_DIR/gui/theme/portrait_hdpi/images/Default/About/maintainer.png"

copy_patch "$PATCHES_DIR/partitionmanager.cpp" \
"$SOURCE_DIR/partitionmanager.cpp"

#copy_patch "$PATCHES_DIR/splash.xml" \
#"$SOURCE_DIR/gui/theme/portrait_hdpi/splash.xml"

#copy_patch "$PATCHES_DIR/splash2.xml" \
#"$SOURCE_DIR/gui/theme/portrait_hdpi/themes/sed/splash.xml"

#copy_patch "$PATCHES_DIR/splash_orig.xml" \
#"$SOURCE_DIR/gui/theme/portrait_hdpi/themes/sed/splash_orig.xml"

copy_patch "$PATCHES_DIR/twrp-functions.cpp" \
"$SOURCE_DIR/twrp-functions.cpp"

echo " All patches applied successfully"
