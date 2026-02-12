#!/bin/bash

# --- Colors for Output ---
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting FedoraRice2 Installation...${NC}"

# --- Create Directories ---
echo -e "${BLUE}📂 Creating config directories...${NC}"
mkdir -p ~/.config/kitty
mkdir -p ~/.config/fastfetch
mkdir -p ~/.local/share/fonts
mkdir -p ~/.local/share/themes
mkdir -p ~/.local/share/icons

# --- Install Starship ---
if ! command -v starship &> /dev/null; then
    echo -e "${BLUE}📦 Installing Starship prompt...${NC}"
    sudo dnf install starship -y
else
    echo -e "${GREEN}✅ Starship is already installed.${NC}"
fi

# --- Copy Configuration Files ---
echo -e "${BLUE}📝 Copying dotfiles...${NC}"
cp -r .config/kitty/* ~/.config/kitty/
cp -r .config/fastfetch/* ~/.config/fastfetch/
cp .config/starship.toml ~/.config/starship.toml

# --- Configure .bashrc ---
echo -e "${BLUE}🔧 Setting up .bashrc...${NC}"
if ! grep -q "starship init bash" ~/.bashrc; then
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
    echo -e "${GREEN}✅ Starship added to .bashrc${NC}"
fi

# --- Final Instructions ---
echo -e "---------------------------------------"
echo -e "${GREEN}✨ Installation Complete!${NC}"
echo -e "---------------------------------------"
echo -e "${BLUE}Next steps:${NC}"
echo -e "1. Restart Kitty or run: ${GREEN}source ~/.bashrc${NC}"
echo -e "2. Install 'Adwaita Mono Nerd Font' if you haven't yet."
echo -e "3. Apply your themes via GNOME Tweaks."
echo -e "---------------------------------------"
