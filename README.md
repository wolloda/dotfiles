# my personal dotfiles for these programs:

* [VIM](https://www.vim.org/)
* [emacs](https://www.gnu.org/software/emacs/)
* [i3](https://i3wm.org/downloads/) & [i3-gaps](https://github.com/Airblader/i3) - wm
* [polybar](https://github.com/jaagr/polybar) - bar
* [rofi](https://github.com/DaveDavenport/rofi) - launcher
* [compton](https://github.com/chjj/compton) - see-through terminal
* [feh](https://github.com/derf/feh) - to change a wallpaper
* [ranger](https://github.com/ranger/ranger) - file manager
* bash
* git

# Requirements
* fzf
* **ag** / ack / ripgrep / pt
* (exuberant) ctags
* [LLVM](https://llvm.org/) (Windows)
* [Chocolatey](https://chocolatey.org/) (Windows)

# Installation
Download necessary files

```
git clone https://gitlab.fi.muni.cz/xkana1/dotfiles.git ~/dotfiles
```

apart from programs mentioned above, following programs need to be installed too (Linux)

* playerctl
* pandoc
* texlive-full
* mupdf


## Emacs

set filepaths in [init.el](.emacs.d/init.el)
* markdown-command

### Windows

* set `$HOME` to ~ or symlink  `dotfiles/.emacs.d` to  `%USERPROFILE%\AppData\Roaming\.emacs.d` (keeps ~ at C:\Users\username\AppData\Roaming)
* symlink `dotfiles/.emacs` to `%USERPROFILE%\AppData\Roaming\.emacs` (used for emacs / spacemacs switching)

### Linux / Mac OS

Symlink `~/dotfiles/.emacs.d/` to `~/.emacs.d/`
Symlink `dotfiles/.emacs` to `~/.emacs`

## VIM

Install [Vundle](https://github.com/VundleVim/Vundle.vim)

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/.vim/bundle/Vundle.vim
```

Symlink `dotfiles/.vimrc`  
Symlink `dotfiles/.gvimrc`  
Launch VIM and run `:PluginInstall`

* [compile YouCompleteMe](https://valloric.github.io/YouCompleteMe)
* [compile vimproc](https://github.com/Shougo/vimproc.vim)
* replace `octol/vim-polyglot`'s cpp-enhanced with [my own fork](https://github.com/wolloda/vim-polyglot) (so as to have structs highlighted)
* properly set paths in [plugin_settings.vim](.vim/plugin_settings.vim)
    * fzf
	* markdown2ctags.py
	* Startify bookmarks
	* ctags.exe
	* python
	* .ycm_extra_conf.py
	* prosession_dir

## Other

Symlink `dotfiles/.bashrc`  
Symlink `dotfiles/.bash_profile`  
Symlink `dotfiles/.config/.compton.conf` to `~/.config/compton.conf`  
Symlink `dotfiles/.tmux.conf` (possibly need to run `tmux source ~/.tmux.conf` or `:source-file ~/.tmux.conf` from within tmux)  

Install tmux plugin manager
```git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm```

Symlink `dotfiles/.ideavimrc`  
Symlink `dotfiles/.gitconfig`  

## Linux setup

Symlink `dotfiles/.config/.i3` to `~/.config/i3/`  
Symlink `dotfiles/.config/polybar` to `~/.config/polybar`  
Symlink `dotfiles/.config/rofi` to `~/.config/rofi` & run `xrdb -load ~/.config/rofi/config`


## Chocolatey

### Install with cmd.exe
Run the following command:

```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

### Install with PowerShell.exe
With PowerShell, there is an additional step. You must ensure Get-ExecutionPolicy is not Restricted. We suggest using Bypass to bypass the policy to get things installed or AllSigned for quite a bit more security.

Run `Get-ExecutionPolicy`. If it returns `Restricted`, then run `Set-ExecutionPolicy AllSigned` or `Set-ExecutionPolicy Bypass -Scope Process`.
Now run the following command:
```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

