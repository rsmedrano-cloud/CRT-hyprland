#!/bin/bash
# Inspired by JaKooLit, Retroed by Non-Sense Nostalgia
# CRT-Hyprland Quick Deploy Script - Deploys theme configs to ~/.config

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR="$HOME/.config"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}[CRT] Deploying theme configs...${NC}"

# Deploy wallust colors (core palette)
echo -e "${YELLOW}  -> Hyprland colors${NC}"
cp "$REPO_DIR/configs/hypr/wallust/wallust-hyprland.conf" "$CONFIG_DIR/hypr/wallust/"

# Deploy UserDecorations
echo -e "${YELLOW}  -> Hyprland decorations${NC}"
cp "$REPO_DIR/configs/hypr/UserConfigs/UserDecorations.conf" "$CONFIG_DIR/hypr/UserConfigs/"

# Deploy Hyprlock
echo -e "${YELLOW}  -> Hyprlock${NC}"
cp "$REPO_DIR/configs/hypr/hyprlock.conf" "$CONFIG_DIR/hypr/"

# Deploy Kitty
echo -e "${YELLOW}  -> Kitty terminal${NC}"
cp "$REPO_DIR/configs/kitty/kitty.conf" "$CONFIG_DIR/kitty/"
mkdir -p "$CONFIG_DIR/kitty/kitty-themes"
cp "$REPO_DIR/configs/kitty/kitty-themes/CRT-Phosphor.conf" "$CONFIG_DIR/kitty/kitty-themes/"

# Deploy Waybar style
echo -e "${YELLOW}  -> Waybar style${NC}"
cp "$REPO_DIR/configs/waybar/style/[CRT] Phosphor Green.css" "$CONFIG_DIR/waybar/style/"

# Deploy Rofi
echo -e "${YELLOW}  -> Rofi theme${NC}"
mkdir -p "$CONFIG_DIR/rofi/wallust"
cp "$REPO_DIR/configs/rofi/themes/CRT-Phosphor.rasi" "$CONFIG_DIR/rofi/themes/"
cp "$REPO_DIR/configs/rofi/wallust/colors-rofi.rasi" "$CONFIG_DIR/rofi/wallust/"
cp "$REPO_DIR/configs/rofi/config.rasi" "$CONFIG_DIR/rofi/"

# Deploy SwayNC
echo -e "${YELLOW}  -> SwayNC notifications${NC}"
cp "$REPO_DIR/configs/swaync/style.css" "$CONFIG_DIR/swaync/"

# Deploy Wlogout
echo -e "${YELLOW}  -> Wlogout${NC}"
cp "$REPO_DIR/configs/wlogout/style.css" "$CONFIG_DIR/wlogout/"

# Deploy Fastfetch
echo -e "${YELLOW}  -> Fastfetch${NC}"
cp "$REPO_DIR/configs/fastfetch/config.jsonc" "$CONFIG_DIR/fastfetch/"

# Deploy btop theme
echo -e "${YELLOW}  -> btop theme${NC}"
mkdir -p "$CONFIG_DIR/btop/themes"
cp "$REPO_DIR/configs/btop/themes/crt-phosphor.theme" "$CONFIG_DIR/btop/themes/"

# Deploy wallpaper
echo -e "${YELLOW}  -> CRT wallpaper${NC}"
if [ -f "$REPO_DIR/wallpapers/crt-grid.png" ]; then
    cp "$REPO_DIR/wallpapers/crt-grid.png" "$CONFIG_DIR/hypr/wallpaper_effects/.wallpaper_current"
fi

echo -e "${GREEN}[CRT] Theme deployed! Reloading...${NC}"

# Reload Hyprland
hyprctl reload 2>/dev/null || echo "Could not reload Hyprland"

# Restart Waybar
killall waybar 2>/dev/null || true
sleep 0.5
waybar &

# Restart SwayNC
killall swaync 2>/dev/null || true
sleep 0.5
swaync &

echo -e "${GREEN}[CRT] Done! You may need to:${NC}"
echo -e "${YELLOW}  1. Switch waybar style: SUPER+CTRL+SHIFT+W${NC}"
echo -e "${YELLOW}  2. Set btop theme: In btop, press O -> Theme -> crt-phosphor${NC}"
echo -e "${YELLOW}  3. Log out/in for full effect${NC}"
