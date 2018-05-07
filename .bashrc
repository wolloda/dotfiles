:
#
# .bashrc	-- Commands executed by each Bash shell at startup
#

. /packages/run/modules-2.0/init/bash 2>/dev/null

# Cestina:
export LANG=cs_CZ.UTF-8

# set proper terminal emulator
if [ -e /usr/share/terminfo/x/xterm-256color  ]; then
	export TERM=xterm-256color
else
	export TERM=xterm
fi
if [ -e /usr/share/terminfo/s/screen-256color  ]; then
	export TERM=screen-256color
else
	export TERM=screen
fi
# don't let core files to overfill our small disks
ulimit -c 0

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

# Add git branch if its present to PS1
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w\[\033[01;31m\] $(parse_git_branch)\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h: \w $(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt

#PS1='\h:$PWD> \$(parse_git_branch)\[\033[00m\]$ '
#PATH=/usr/sbin:/sbin:/usr/etc:$PATH
alias tmux="tmux -2" # make tmux recognize 256 color support terminals
export BROWSER="google-chrome"
#export EDITOR=/ vi
#export VISUAL=/ vi

# vi mode in bash
set -o vi

export PS1 PATH

alias ll="ls -l"
case "$(uname)" in
   "Linux")
      alias ls="ls --color"
   ;;
   "Darwin")
      alias ls="ls -G"
   ;;
esac

export CC=clang
export CXX=clang++
if [ `hostname` == "aisa.fi.muni.cz" ]; then
	module add cmake-3.6.2
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

