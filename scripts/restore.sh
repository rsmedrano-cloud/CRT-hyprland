#!/bin/bash
# Inspired by JaKooLit, Retroed by Non-Sense Nostalgia
# CRT-Hyprland Restore Script - Restores original JaKooLit configs

set -e

CONFIG_DIR="$HOME/.config"
BACKUP_SUFFIX="-backup-preretroing"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}╔═══════════════════════════════════════════════════╗${NC}"
echo -e "${YELLOW}║  🔄 CRT-Hyprland Restore                          ║${NC}"
echo -e "${YELLOW}║  Restoring original JaKooLit configs              ║${NC}"
echo -e "${YELLOW}╚═══════════════════════════════════════════════════╝${NC}"
echo ""

# Function to restore config
restore_config() {
    local config_name=$1
    local backup_dir="$CONFIG_DIR/$config_name$BACKUP_SUFFIX"
    local target_dir="$CONFIG_DIR/$config_name"
    
    if [ -d "$backup_dir" ]; then
        echo -e "${GREEN}Restoring $config_name...${NC}"
        rm -rf "$target_dir"
        cp -r "$backup_dir" "$target_dir"
    else
        echo -e "${YELLOW}No backup found for $config_name, skipping...${NC}"
    fi
}

echo "This will restore your original configs from before CRT installation."
echo "Are you sure? (y/n)"
read -r response
if [ "$response" != "y" ]; then
    echo "Cancelled."
    exit 0
fi

# Restore configs
for config in hypr waybar kitty rofi swaync wlogout; do
    restore_config "$config"
done

# Reload Hyprland
echo ""
echo -e "${GREEN}Reloading Hyprland...${NC}"
hyprctl reload 2>/dev/null || echo "Could not reload Hyprland automatically"

# Restart Waybar
killall waybar 2>/dev/null || true
waybar &

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✅ Restore Complete!                             ║${NC}"
echo -e "${GREEN}║                                                   ║${NC}"
echo -e "${GREEN}║  Original JaKooLit configs restored.              ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════╝${NC}"
