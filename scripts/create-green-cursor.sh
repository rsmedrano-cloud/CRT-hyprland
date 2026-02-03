#!/bin/bash
# Create CRT Phosphor Green cursor theme from pixelfun3
# This script recolors the white cursor to phosphor green

set -e

THEME_NAME="CRT-Phosphor-Green"
SOURCE_THEME="/usr/share/icons/pixelfun3"
DEST_DIR="$HOME/.local/share/icons/$THEME_NAME"
WORK_DIR="/tmp/cursor-green-work"

echo "🟢 Creating CRT Phosphor Green cursor theme..."

# Clean and create directories
rm -rf "$WORK_DIR" "$DEST_DIR"
mkdir -p "$WORK_DIR/pngs" "$DEST_DIR/cursors"

# Create index.theme
cat > "$DEST_DIR/index.theme" << 'EOF'
[Icon Theme]
Name=CRT Phosphor Green
Comment=Retro pixel cursor in phosphor green - by Non-Sense Nostalgia
Inherits=pixelfun3
EOF

# Key cursors to create (the main ones)
CURSORS=(
    "left_ptr:default:arrow"
    "pointer:hand:pointing_hand"
    "text:xterm:ibeam"
    "wait:watch"
    "progress:left_ptr_watch"
    "crosshair:cross:tcross"
    "not-allowed:forbidden:circle"
    "help:question_arrow:whats_this"
    "ew-resize:sb_h_double_arrow:col-resize"
    "ns-resize:sb_v_double_arrow:row-resize"
    "move:fleur:grabbing"
    "copy:dnd-copy"
    "link:dnd-link"
)

# Create simple green pixel cursor PNGs
echo "Creating green pixel cursor images..."

# Main pointer - 16x16 retro pixel arrow
convert -size 16x16 xc:transparent \
    -fill "#00FF00" \
    -draw "rectangle 0,0 1,0" \
    -draw "rectangle 0,1 2,1" \
    -draw "rectangle 0,2 3,2" \
    -draw "rectangle 0,3 4,3" \
    -draw "rectangle 0,4 5,4" \
    -draw "rectangle 0,5 6,5" \
    -draw "rectangle 0,6 7,6" \
    -draw "rectangle 0,7 8,7" \
    -draw "rectangle 0,8 4,8" \
    -draw "rectangle 0,9 3,9" \
    -draw "rectangle 3,10 5,10" \
    -draw "rectangle 4,11 6,11" \
    -draw "rectangle 5,12 7,12" \
    "$WORK_DIR/pngs/left_ptr.png"

# Text cursor - simple I-beam
convert -size 16x16 xc:transparent \
    -fill "#00FF00" \
    -draw "rectangle 3,0 12,1" \
    -draw "rectangle 7,2 8,13" \
    -draw "rectangle 3,14 12,15" \
    "$WORK_DIR/pngs/text.png"

# Hand/pointer cursor
convert -size 16x16 xc:transparent \
    -fill "#00FF00" \
    -draw "rectangle 5,0 6,1" \
    -draw "rectangle 5,2 6,7" \
    -draw "rectangle 2,4 3,8" \
    -draw "rectangle 8,4 9,8" \
    -draw "rectangle 11,6 12,8" \
    -draw "rectangle 2,9 12,12" \
    -draw "rectangle 3,13 11,15" \
    "$WORK_DIR/pngs/pointer.png"

# Wait/watch cursor - hourglass
convert -size 16x16 xc:transparent \
    -fill "#00FF00" \
    -draw "rectangle 3,0 12,1" \
    -draw "rectangle 4,2 11,2" \
    -draw "rectangle 5,3 10,4" \
    -draw "rectangle 6,5 9,6" \
    -draw "rectangle 7,7 8,8" \
    -draw "rectangle 6,9 9,10" \
    -draw "rectangle 5,11 10,12" \
    -draw "rectangle 4,13 11,13" \
    -draw "rectangle 3,14 12,15" \
    "$WORK_DIR/pngs/wait.png"

# Crosshair
convert -size 16x16 xc:transparent \
    -fill "#00FF00" \
    -draw "rectangle 7,0 8,6" \
    -draw "rectangle 7,9 8,15" \
    -draw "rectangle 0,7 6,8" \
    -draw "rectangle 9,7 15,8" \
    "$WORK_DIR/pngs/crosshair.png"

# Not allowed - X
convert -size 16x16 xc:transparent \
    -fill "#00FF00" \
    -draw "rectangle 2,2 4,4" \
    -draw "rectangle 11,2 13,4" \
    -draw "rectangle 5,5 6,6" \
    -draw "rectangle 9,5 10,6" \
    -draw "rectangle 7,7 8,8" \
    -draw "rectangle 5,9 6,10" \
    -draw "rectangle 9,9 10,10" \
    -draw "rectangle 2,11 4,13" \
    -draw "rectangle 11,11 13,13" \
    "$WORK_DIR/pngs/not-allowed.png"

# Resize horizontal
convert -size 16x16 xc:transparent \
    -fill "#00FF00" \
    -draw "rectangle 0,7 15,8" \
    -draw "rectangle 1,6 1,6" \
    -draw "rectangle 2,5 2,5" \
    -draw "rectangle 3,4 3,4" \
    -draw "rectangle 1,9 1,9" \
    -draw "rectangle 2,10 2,10" \
    -draw "rectangle 3,11 3,11" \
    -draw "rectangle 14,6 14,6" \
    -draw "rectangle 13,5 13,5" \
    -draw "rectangle 12,4 12,4" \
    -draw "rectangle 14,9 14,9" \
    -draw "rectangle 13,10 13,10" \
    -draw "rectangle 12,11 12,11" \
    "$WORK_DIR/pngs/ew-resize.png"

# Resize vertical
convert -size 16x16 xc:transparent \
    -fill "#00FF00" \
    -draw "rectangle 7,0 8,15" \
    -draw "rectangle 6,1 6,1" \
    -draw "rectangle 5,2 5,2" \
    -draw "rectangle 4,3 4,3" \
    -draw "rectangle 9,1 9,1" \
    -draw "rectangle 10,2 10,2" \
    -draw "rectangle 11,3 11,3" \
    -draw "rectangle 6,14 6,14" \
    -draw "rectangle 5,13 5,13" \
    -draw "rectangle 4,12 4,12" \
    -draw "rectangle 9,14 9,14" \
    -draw "rectangle 10,13 10,13" \
    -draw "rectangle 11,12 11,12" \
    "$WORK_DIR/pngs/ns-resize.png"

# Move cursor
convert -size 16x16 xc:transparent \
    -fill "#00FF00" \
    -draw "rectangle 7,0 8,15" \
    -draw "rectangle 0,7 15,8" \
    -draw "rectangle 6,1 6,2" \
    -draw "rectangle 9,1 9,2" \
    -draw "rectangle 5,2 5,2" \
    -draw "rectangle 10,2 10,2" \
    -draw "rectangle 6,13 6,14" \
    -draw "rectangle 9,13 9,14" \
    -draw "rectangle 5,13 5,13" \
    -draw "rectangle 10,13 10,13" \
    -draw "rectangle 1,6 2,6" \
    -draw "rectangle 1,9 2,9" \
    -draw "rectangle 2,5 2,5" \
    -draw "rectangle 2,10 2,10" \
    -draw "rectangle 13,6 14,6" \
    -draw "rectangle 13,9 14,9" \
    -draw "rectangle 13,5 13,5" \
    -draw "rectangle 13,10 13,10" \
    "$WORK_DIR/pngs/move.png"

# Help cursor - question mark
convert -size 16x16 xc:transparent \
    -fill "#00FF00" \
    -draw "rectangle 5,1 10,2" \
    -draw "rectangle 4,3 5,4" \
    -draw "rectangle 10,3 11,4" \
    -draw "rectangle 9,5 10,6" \
    -draw "rectangle 7,7 8,9" \
    -draw "rectangle 7,11 8,13" \
    "$WORK_DIR/pngs/help.png"

echo "Converting to X cursors..."

# Create cursor config files and build cursors
for png in "$WORK_DIR/pngs"/*.png; do
    name=$(basename "$png" .png)
    echo "16 0 0 $png" > "$WORK_DIR/${name}.conf"
    xcursorgen "$WORK_DIR/${name}.conf" "$DEST_DIR/cursors/$name"
done

# Create symlinks for cursor aliases
echo "Creating cursor aliases..."
cd "$DEST_DIR/cursors"

# left_ptr aliases
ln -sf left_ptr default
ln -sf left_ptr arrow
ln -sf left_ptr top_left_arrow

# pointer aliases
ln -sf pointer hand
ln -sf pointer hand1
ln -sf pointer hand2
ln -sf pointer pointing_hand

# text aliases
ln -sf text xterm
ln -sf text ibeam

# wait aliases
ln -sf wait watch
ln -sf wait progress
ln -sf wait left_ptr_watch

# crosshair aliases
ln -sf crosshair cross
ln -sf crosshair tcross

# not-allowed aliases
ln -sf not-allowed forbidden
ln -sf not-allowed circle
ln -sf not-allowed no-drop
ln -sf not-allowed dnd-no-drop

# resize aliases
ln -sf ew-resize sb_h_double_arrow
ln -sf ew-resize col-resize
ln -sf ew-resize size_hor
ln -sf ew-resize e-resize
ln -sf ew-resize w-resize
ln -sf ns-resize sb_v_double_arrow
ln -sf ns-resize row-resize
ln -sf ns-resize size_ver
ln -sf ns-resize n-resize
ln -sf ns-resize s-resize

# move aliases
ln -sf move fleur
ln -sf move grabbing
ln -sf move grab
ln -sf move size_all
ln -sf move dnd-move

# help aliases
ln -sf help question_arrow
ln -sf help whats_this
ln -sf help left_ptr_help

# copy/link - use pointer as base
ln -sf pointer copy
ln -sf pointer dnd-copy
ln -sf pointer link
ln -sf pointer dnd-link
ln -sf pointer alias

# Additional common cursors
ln -sf left_ptr context-menu
ln -sf left_ptr openhand
ln -sf move closedhand

echo "✅ CRT Phosphor Green cursor theme created at: $DEST_DIR"
echo ""
echo "To activate: hyprctl setcursor CRT-Phosphor-Green 16"
