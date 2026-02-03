# 🖥️ CRT-Hyprland

> **Inspired by [JaKooLit](https://github.com/JaKooLit/Arch-Hyprland), Retroed by Non-Sense Nostalgia**

A phosphor-green CRT retro terminal aesthetic for Hyprland on Arch Linux.

![CRT Preview](wallpapers/preview.png)

## Features

- 🟢 **Phosphor Green** color scheme throughout
- 📺 **Subtle CRT effects**: scanlines, bloom, glow (no curvature except wallpaper)
- ⌨️ **Bitmap fonts** for authentic retro feel
- 🎨 **Themed components**: Waybar, Rofi, Kitty, SwayNC, Hyprlock, Wlogout
- ⚡ **Performance-focused**: designed for daily use without GPU strain

## Installation

### Prerequisites

- Hyprland with JaKooLit dots (or compatible setup)
- Arch Linux (or Arch-based distro)

### Quick Install

```bash
# Clone this repo
git clone https://github.com/YOUR_USERNAME/CRT-hyprland.git
cd CRT-hyprland

# Run install script
./scripts/install.sh
```

### Manual Installation

1. **Backup your current configs** (this repo maintains backups)
2. **Install fonts**:
   ```bash
   yay -S ttf-terminus-nerd otf-cozette
   ```
3. **Copy configs** to their respective locations in `~/.config/`
4. **Reload Hyprland**: `hyprctl reload`

## Structure

```
CRT-hyprland/
├── configs/
│   ├── hypr/          # Hyprland configs (colors, decorations)
│   ├── waybar/        # Waybar CRT style
│   ├── kitty/         # Kitty terminal theme
│   ├── rofi/          # Rofi launcher theme
│   ├── swaync/        # Notification styling
│   └── wlogout/       # Logout menu styling
├── wallpapers/        # CRT-styled wallpapers
├── fonts/             # Bitmap fonts (if not in AUR)
└── scripts/           # Installation and utility scripts
```

## Color Palette

| Name | Hex | Preview |
|------|-----|---------|
| Background | `#0a0a0a` | ⬛ |
| Primary Green | `#00FF00` | 🟢 |
| Bright Green | `#33FF33` | 🟢 |
| Dim Green | `#00AA00` | 🟢 |
| Dark Green | `#004400` | 🟢 |

## Credits

- Original Hyprland dotfiles: [JaKooLit](https://github.com/JaKooLit/Arch-Hyprland)
- CRT inspiration: [cool-retro-term](https://github.com/Swordfish90/cool-retro-term)
- Phosphor aesthetics: Classic IBM terminals

## License

MIT License - Feel free to fork and customize!
