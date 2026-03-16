#!/bin/bash

patch_caps() {
  [ ! -f "$1" ] && echo "Error: '$1' not found" && return 1

  # Get index (I) and offset (O) for caps 0x81
  read I O <<<$(otool -f "$1" | awk '/architecture/{i=$2} /capabilities 0x81/{f=1} f&&/offset/{print i, $2; exit}')

  if [ -n "$O" ]; then
    # Patch Fat (offset+4) and Mach-O (slice+11) -> 0x80
    printf '\x80' | dd of="$1" bs=1 seek=$((8 + I * 20 + 4)) count=1 conv=notrunc 2>/dev/null
    printf '\x80' | dd of="$1" bs=1 seek=$((O + 11)) count=1 conv=notrunc 2>/dev/null

    echo "Patched $1 (Arch $I). Resigning..."
    codesign -f -s - "$1" &>/dev/null
  else
    echo "No target architecture (caps 0x81) found in '$1'."
  fi
}

patch_caps "/Library/ScriptingAdditions/yabai.osax/Contents/MacOS/loader"
