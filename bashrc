# /etc/skel/.bashrc:
# $Header: /home/cvsroot/gentoo-src/rc-scripts/etc/skel/.bashrc,v 1.8 2003/02/28 15:45:35 azarah Exp $

# This file is sourced by all *interactive* bash shells on startup.  This
# file *should generate no output* or it will break the scp and rcp commands.

# colors for ls, etc.
export RADEON_HYPERZ=1
export LIBVA_DRIVER_NAME=gallium

alias d="ls --color -h"
alias ls="ls --color -Fh"
alias ll="ls --color -lh"
alias gvim="gvim -p"
alias vless='vim -u /usr/share/vim/vim81/macros/less.vim'

#Use wayland
SDL_VIDEODRIVER=wayland

export ECHANGELOG_USER="AzP <peterasplund@gentoo.se>"

# Change the window title of X terminals 
case $TERM in
	urxvt|rxvt-unicode|xterm*|rxvt|Eterm|eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac

#Set up 256 color terminal
if [ "$TERM" = "xterm" ] ; then
	export TERM="xterm-256color"
	if [ -n "$XTERM_VERSION" ] ; then
		case "$XTERM_VERSION" in
			"XTerm(256)") TERM="xterm-256color" ;;
			"XTerm(88)") TERM="xterm-88color" ;;
			"XTerm") TERM="xterm" ;;
			*) echo "Warning: Unrecognized XTERM_VERSION: $XTERM_VERSION" ;;
		esac
	fi
fi

SCREEN_COLORS="`tput colors`"
if [ -z "$SCREEN_COLORS" ] ; then
	case "$TERM" in
		screen-*color-bce)
			echo "Unknown terminal $TERM. Falling back to 'screen-bce'."
			export TERM=screen-bce
			;;
		*-88color)
			echo "Unknown terminal $TERM. Falling back to 'xterm-88color'."
			export TERM=xterm-88color
			;;
		*-256color)
			echo "Unknown terminal $TERM. Falling back to 'xterm-256color'."
			export TERM=xterm-256color
			;;
	esac
	SCREEN_COLORS=`tput colors`
fi
if [ -z "$SCREEN_COLORS" ] ; then
	case "$TERM" in
		gnome*|xterm*|konsole*|aterm|[Ee]term)
			echo "Unknown terminal $TERM. Falling back to 'xterm'."
			export TERM=xterm
			;;
		rxvt*)
			echo "Unknown terminal $TERM. Falling back to 'rxvt'."
			export TERM=rxvt
			;;
		screen*)
			echo "Unknown terminal $TERM. Falling back to 'screen'."
			export TERM=screen
			;;
	esac
	SCREEN_COLORS=`tput colors`
fi

##uncomment the following to activate bash-completion:
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion

#export PS1="\[\033[32m\]\u\[\033[0m\]@\[\033[1;31m\]\H\[\033[0m\]\$ "
