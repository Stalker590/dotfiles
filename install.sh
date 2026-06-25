#!/bin/bash

# Спочатку блоки з встановленням пакетів, які в тебе вже є на image_3e3bc8.png
if [ -f /etc/arch-release ]; then
    echo "Ти на Arch, ставлю через pacman..."
    sudo pacman -S --needed - < pkglist_arch.txt
elif [ -f /etc/fedora-release ]; then
    echo "Ти на Fedora, ставлю через dnf..."
    sudo dnf install -y $(cat pkglist_fedora.txt)
fi

# А ось тут додаєш лінки для твоїх конфігів:
echo "Створюю символьні посилання..."

# Створюємо необхідні папки, якщо їх немає
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/alacritty

# Самі лінки (ln -sf [звідки] [куди])
ln -sf $HOME/dotfiles/i3/config $HOME/.config/i3/config
ln -sf $HOME/dotfiles/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
ln -sf $HOME/dotfiles/bashrc $HOME/.bashrc

echo "Готово, всі лінки на місці!"
