#!/usr/bin/env bash

SCRIPTLOC=${BASH_SOURCE%/*};

for S in $(find  ${SCRIPTLOC} -maxdepth 1 -type f \
	| grep -v Keypirinha  \
	| grep -v README \
	| grep -v gitignore \
	| grep -v install);

do
	rm ~/$S;
	ln -s /home/wollf/dotfiles/$S /home/wollf/$S;
done

ln -s bin/ ~/bin
ln -s .emacs.d/ ~/.emacs.d/
ln -s .config/.compton.conf ~/.config/compton.conf
ln -s .config/.i3/ ~/.config/i3/
ln -s .config/polybar/ ~/.config/polybar/
ln -s .config/rofi/ ~/.config/rofi/

git clone https://github.com/VundleVim/Vundle.vim.git ${SCRIPTLOC}/.vim/bundle/Vundle.vim
