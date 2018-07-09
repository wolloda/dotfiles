:
# .bashrc	-- Commands executed by each Bash shell at startup

#. /packages/run/modules-2.0/init/bash 2>/dev/null

# PATH settings

#PATH=/usr/sbin:/sbin:/usr/etc:$PATH
# IntelliJ IDEA
PATH=/opt/idea-IU-181.4892.42/bin:$PATH
# Netlogo
PATH=/opt/Netlogo-6.0.2:$PATH

# export
export LANG=cs_CZ.UTF-8

export BROWSER="google-chrome"
export EDITOR=vim
export VISUAL=vim
export PATH

# use clang as a default C / C++ compiler
export CC=clang
export CXX=clang++

# vi mode in bash
set -o vi

# set proper terminal emulator {{{
if [ -e /usr/share/terminfo/x/xterm-256color  ]; then
	export TERM=xterm-256color
elif [ -e /usr/share/terminfo/x/xterm+256color  ]; then 
	export TERM=xterm+256color
elif [ -e /usr/share/terminfo/s/screen-256color  ]; then
	export TERM=screen-256color
#elif [ -e /usr/share/terminfo/s/screen-256color-s  ]; then
	#export TERM=screen-256color-s
else
	export TERM=xterm
	#export TERM=screen
fi
export TERM=xterm-256color
# }}}

# prevent creation of core files
ulimit -c 0

# uncomment for a colored prompt
force_color_prompt=yes

# PS1 {{{
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo "[${BRANCH}]"
	else
		echo ""
	fi
}

export PS1="\[\e[36m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[36m\]\h\[\e[m\] \[\e[31m\]\w\[\e[m\] \[\e[31m\]\`parse_git_branch\`\[\e[m\] \\$ "
# }}}
unset color_prompt force_color_prompt

# Avoid succesive duplicates in the bash command history.
export HISTCONTROL=ignoredups

# unfreeze with any key after hitting CTRL_S
stty start undef

# disable freezing terminal with CTRL_S
stty -ixon

# disable annoying beeping
set bell-style none

if [ `hostname` == "aisa.fi.muni.cz" ]; then
	module add cmake-3.6.2
fi

# FZF {{{

# let fzf search through hidden files
# also use ag as default search tool (faster)
if hash ag 2>/dev/null; then
	export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -f -g ""'
else
	export FZF_DEFAULT_COMMAND='find -L'
fi

# set default height, use border
export FZF_DEFAULT_OPTS='--height 40%  --border'

# enable using fzf in bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# }}}

[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# vim: set foldmethod=marker :
