#!/bin/bash

# 1. Get the exact directory where the script is located
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 2. Define the paths
DESKTOP_FILE="$HOME/.local/share/applications/z-organizer.desktop"
USER_DESKTOP=$(xdg-user-dir DESKTOP)

# Make the main app executable
chmod +x "$DIR/Z-Organizer"

# 3. Create the shortcut file injecting the absolute paths
echo "[Desktop Entry]" > "$DESKTOP_FILE"
echo "Name=Z-Organizer" >> "$DESKTOP_FILE"
echo "Comment=Smart File Management" >> "$DESKTOP_FILE"
echo "Exec=\"$DIR/Z-Organizer\"" >> "$DESKTOP_FILE"
echo "Path=$DIR" >> "$DESKTOP_FILE"
echo "Icon=$DIR/bin/icon.png" >> "$DESKTOP_FILE"
echo "Terminal=false" >> "$DESKTOP_FILE"
echo "Type=Application" >> "$DESKTOP_FILE"
echo "Categories=Utility;System;FileTools;" >> "$DESKTOP_FILE"
echo "StartupWMClass=Z-Organizer" >> "$DESKTOP_FILE"

# 4. Give execution permission to the menu shortcut
chmod +x "$DESKTOP_FILE"

# 5. Copy the shortcut to the Desktop and make it executable
if [ -d "$USER_DESKTOP" ]; then
    cp "$DESKTOP_FILE" "$USER_DESKTOP/"
    chmod +x "$USER_DESKTOP/z-organizer.desktop"
fi

echo "================================================="
echo " Success! Shortcut added to Application Menu"
echo " AND copied to your Desktop."
echo "================================================="

cd core
nohup ./Z-Organizer >/dev/null 2>&1 &
disown

sleep 2
