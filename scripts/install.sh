#!/bin/bash
# Inspired by JaKooLit, Retroed by Non-Sense Nostalgia
# CRT-Hyprland Installation Script

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR="$HOME/.config"
BACKUP_SUFFIX="-backup-preretroing"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}╔═══════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  🖥️  CRT-Hyprland Installation                     ║${NC}"
echo -e "${GREEN}║  Inspired by JaKooLit, Retroed by Non-Sense        ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════╝${NC}"
echo ""

# Function to backup config
backup_config() {
    local config_name=$1
    local source_dir="$CONFIG_DIR/$config_name"
    local backup_dir="$CONFIG_DIR/$config_name$BACKUP_SUFFIX"
    
    if [ -d "$source_dir" ] && [ ! -d "$backup_dir" ]; then
        echo -e "${YELLOW}Backing up $config_name...${NC}"
        cp -r "$source_dir" "$backup_dir"
    fi
}

# Function to install config
install_config() {
    local config_name=$1
    local source_dir="$REPO_DIR/configs/$config_name"
    local target_dir="$CONFIG_DIR/$config_name"
    
    if [ -d "$source_dir" ]; then
        echo -e "${GREEN}Installing $config_name config...${NC}"
        cp -r "$source_dir"/* "$target_dir"/
    fi
}

# Check for required dependencies
echo "Checking dependencies..."
DEPS=("hyprland" "waybar" "kitty" "rofi" "swaync")
MISSING=()

for dep in "${DEPS[@]}"; do
    if ! command -v "$dep" &> /dev/null && ! pacman -Qi "$dep" &> /dev/null 2>&1; then
        MISSING+=("$dep")
    fi
done

if [ ${#MISSING[@]} -gt 0 ]; then
    echo -e "${YELLOW}Warning: Some dependencies may be missing: ${MISSING[*]}${NC}"
    echo "Continue anyway? (y/n)"
    read -r response
    if [ "$response" != "y" ]; then
        exit 1
    fi
fi

# Install fonts
echo ""
echo -e "${GREEN}Installing fonts...${NC}"
if command -v yay &> /dev/null; then
    yay -S --needed --noconfirm ttf-terminus-nerd otf-cozette 2>/dev/null || echo "Some fonts may already be installed or unavailable"
elif command -v paru &> /dev/null; then
    paru -S --needed --noconfirm ttf-terminus-nerd otf-cozette 2>/dev/null || echo "Some fonts may already be installed or unavailable"
else
    echo -e "${YELLOW}No AUR helper found. Please install fonts manually:${NC}"
    echo "  yay -S ttf-terminus-nerd otf-cozette"
fi

# Backup existing configs
echo ""
echo -e "${GREEN}Creating backups...${NC}"
for config in hypr waybar kitty rofi swaync wlogout; do
    backup_config "$config"
done

# Install CRT configs
echo ""
echo -e "${GREEN}Installing CRT theme configs...${NC}"
for config in hypr waybar kitty rofi swaync wlogout; do
    install_config "$config"
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
echo -e "${GREEN}║  ✅ Installation Complete!                        ║${NC}"
echo -e "${GREEN}║                                                   ║${NC}"
echo -e "${GREEN}║  Backups saved to ~/.config/*-backup-preretroing  ║${NC}"
echo -e "${GREEN}║                                                   ║${NC}"
echo -e "${GREEN}║  To restore: ./scripts/restore.sh                 ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════╝${NC}"
