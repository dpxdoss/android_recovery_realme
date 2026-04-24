# Custom patch script - OrangeFox
# by: @dantepaulxd (2026)

set -e  # stop on error

echo "== OrangeFox Custom Patch Script =="

PATCHES_DIR="$GITHUB_WORKSPACE/OrangeFox/fox_12.1/${DEVICE_PATH}/patches"
SOURCE_DIR="$GITHUB_WORKSPACE/OrangeFox/fox_12.1/bootable/recovery"

# --- Safety checks ---
if [ ! -d "$PATCHES_DIR" ]; then
@@ -23,43 +34,38 @@
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
# replace blank maintainer image
copy_patch "$PATCHES_DIR/maintainer.png" \
"$SOURCE_DIR/gui/theme/portrait_hdpi/images/Default/About/maintainer.png"

# rearrange wipe menu order placing removable device bottom.
copy_patch "$PATCHES_DIR/partitionmanager.cpp" \
"$SOURCE_DIR/partitionmanager.cpp"\

# replacing telegram support link on welcomed log.
copy_patch "$PATCHES_DIR/twrp-functions.cpp" \
"$SOURCE_DIR/twrp-functions.cpp"

# custom default theme configs
#copy_patch "$PATCHES_DIR/splash.xml" \
#"$SOURCE_DIR/gui/theme/portrait_hdpi/splash.xml"
#copy_patch "$PATCHES_DIR/splash2.xml" \
#"$SOURCE_DIR/gui/theme/portrait_hdpi/themes/sed/splash.xml"
#copy_patch "$PATCHES_DIR/splash_orig.xml" \
#"$SOURCE_DIR/gui/theme/portrait_hdpi/themes/sed/splash_orig.xml"

echo " All patches applied successfully"
