#!/usr/bin/env bash

#Symlink `dotfiles/.bashrc`  
ln ~/dotfiles/.bashrc ~/.bashrc

#Symlink `dotfiles/.bash_profile`  
ln ~/dotfiles/.bash_profile ~/.bash_profile

#Symlink `dotfiles/.compton.conf` to `~/.config`  
ln ~/dotfiles/.compton.conf ~/.config/compton.conf

#Symlink `dotfiles/.tmux.conf` (possibly need to run `tmux source ~/.tmux.conf`)  
ln ~/dotfiles/.tmux.conf ~/.tmux.conf

#Symlink `dotfiles/.ideavimrc`  
ln ~/dotfiles/.ideavimrc ~/.ideavimrc

#Symlink `dotfiles/.gitconfig`  
ln ~/dotfiles/.gitconfig ~/.gitconfig

#Symlink `dotfiles/.i3` to `~/.i3`  
#ln -s ~/dotfiles/.i3/ ~/.config/i3

#Symlink `dotfiles/polybar` to `~/.config/polybar`  
#ln -s ~/dotfiles/polybar/ ~/.config/polybar

#Symlink `dotfiles/rofi` to `~/.config/rofi` & run `xrdb -load ~/.config/rofi/config`
ln -s ~/dotfiles/rofi/ ~/.config/rofi
xrdb -load ~/.config/rofi/config

#symlink `dotfiles/.emacs` to `%USERPROFILE%\AppData\Roaming\.emacs` (used for emacs / spacemacs switching)
#ln -s ~/dotfiles/.emacs C:/Users/kanav/AppData/Roaming/.emacs

#set `$HOME` to ~ or symlink  `dotfiles/.emacs.d` to  `%USERPROFILE%\AppData\Roaming\.emacs.d` (keeps ~ at C:\Users\username\AppData\Roaming)
#ln -s ~/dotfiles/.emacs.d/ C:/Users/kanav/AppData/Roaming/.emacs.d/

