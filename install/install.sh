#!/bin/bash
set -euo pipefail

# Colors for output
GREEN="\033[0;32m"
NC="\033[0m"

echo -e "${GREEN}Starting Arch Linux install script...${NC}"

# Update system and install base-devel and git for building AUR packages
sudo pacman -Sy --noconfirm --needed base-devel git

# Install paru if not installed
if ! command -v paru &> /dev/null; then
  echo -e "${GREEN}Installing paru AUR helper...${NC}"
  tmpdir=$(mktemp -d)
  git clone https://aur.archlinux.org/paru.git "$tmpdir/paru"
  cd "$tmpdir/paru"
  makepkg -si --noconfirm
  cd -
  rm -rf "$tmpdir"
else
  echo -e "${GREEN}paru is already installed.${NC}"
fi

echo -e "${GREEN}Installing official repo packages...${NC}"

# Official repo packages
official_packages=(
  base-devel
  unzip
  zip
  wget
  git
  vim
  htop
  ncdu
  strace
  stow
  brightnessctl
  tlp
  networkmanager
  bluez
  bluez-utils
  blueman
  ethtool
  net-tools
  hyprland
  hypridle
  hyprlock
  hyprpaper
  hyprpicker
  hyprpolkitagent
  sddm
  lxappearance
  rofi
  pavucontrol
  playerctl
  cliphist
  swappy
  swaync
  pipewire
  pipewire-alsa
  pipewire-jack
  pipewire-pulse
  qt5-wayland
  qt6-wayland
  xdg-desktop-portal-gtk
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-wlr
  xdg-user-dirs
  kitty
  nautilus
  flatpak
  httpie
  sof-firmware
  noto-fonts-emoji
  ttf-material-icons-git
  ttf-ms-fonts
)

# Install official packages
paru -S --needed --noconfirm "${official_packages[@]}"

echo -e "${GREEN}Installing AUR packages...${NC}"

aur_packages=(
  discord
  obsidian
  starship
  visual-studio-code-bin
  zen-browser-bin
  rustrover
  rustrover-jre
  git-credential-manager-bin
  ftb-app-bin
  satty
  slurp
  udiskie
  wireshark-qt
  xdotool
  appmenu-gtk-module
  arc-gtk-theme
  egl-wayland
  glfw
  grim
  less
)

# Install AUR packages
paru -S --needed --noconfirm "${aur_packages[@]}"

echo -e "${GREEN}Installation complete!${NC}"
