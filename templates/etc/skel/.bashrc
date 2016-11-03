# {{ ansible_managed }}

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# Show Git branch/tag, or name-rev if on detached head
function parse_git_branch {
  git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD 2> /dev/null |cut -d"/" -f2
}

GIT_PS="$(parse_git_branch)"

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=99999999
HISTSIZE=99999999


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

shopt -s histverify

PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Сброс
Sh_Color_Off='\[\033[00m\]'       # Text Reset

# Обычные цвета
Sh_Color_Black='\[\033[0;30m\]'        # Black
Sh_Color_Red='\[\033[0;31m\]'          # Red
Sh_Color_Green='\[\033[0;32m\]'        # Green
Sh_Color_Yellow='\[\033[0;33m\]'       # Yellow
Sh_Color_Blue='\[\033[0;34m\]'         # Blue
Sh_Color_Purple='\[\033[0;35m\]'       # Purple
Sh_Color_Cyan='\[\033[0;36m\]'         # Cyan
Sh_Color_White='\[\033[0;37m\]'        # White

# Жирные
Sh_Color_BBlack='\[\033[1;30m\]'       # Black
Sh_Color_BRed='\[\033[1;31m\]'         # Red
Sh_Color_BGreen='\[\033[1;32m\]'       # Green
Sh_Color_BYellow='\[\033[1;33m\]'      # Yellow
Sh_Color_BBlue='\[\033[1;34m\]'        # Blue
Sh_Color_BPurple='\[\033[1;35m\]'      # Purple
Sh_Color_BCyan='\[\033[1;36m\]'        # Cyan
Sh_Color_BWhite='\[\033[1;37m\]'       # White

# Подчёркнутые
Sh_Color_UBlack='\[\033[4;30m\]'       # Black
Sh_Color_URed='\[\033[4;31m\]'         # Red
Sh_Color_UGreen='\[\033[4;32m\]'       # Green
Sh_Color_UYellow='\[\033[4;33m\]'      # Yellow
Sh_Color_UBlue='\[\033[4;34m\]'        # Blue
Sh_Color_UPurple='\[\033[4;35m\]'      # Purple
Sh_Color_UCyan='\[\033[4;36m\]'        # Cyan
Sh_Color_UWhite='\[\033[4;37m\]'       # White

# Фоновые
Sh_Color_On_Black='\[\033[40m\]'       # Black
Sh_Color_On_Red='\[\033[41m\]'         # Red
Sh_Color_On_Green='\[\033[42m\]'       # Green
Sh_Color_On_Yellow='\[\033[43m\]'      # Yellow
Sh_Color_On_Blue='\[\033[44m\]'        # Blue
Sh_Color_On_Purple='\[\033[45m\]'      # Purple
Sh_Color_On_Cyan='\[\033[46m\]'        # Cyan
Sh_Color_On_White='\[\033[47m\]'       # White

# Высоко Интенсивные
Sh_Color_IBlack='\[\033[0;90m\]'       # Black
Sh_Color_IRed='\[\033[0;91m\]'         # Red
Sh_Color_IGreen='\[\033[0;92m\]'       # Green
Sh_Color_IYellow='\[\033[0;93m\]'      # Yellow
Sh_Color_IBlue='\[\033[0;94m\]'        # Blue
Sh_Color_IPurple='\[\033[0;95m\]'      # Purple
Sh_Color_ICyan='\[\033[0;96m\]'        # Cyan
Sh_Color_IWhite='\[\033[0;97m\]'       # White

# Жирные Высоко Интенсивные
Sh_Color_BIBlack='\[\033[1;90m\]'      # Black
Sh_Color_BIRed='\[\033[1;91m\]'        # Red
Sh_Color_BIGreen='\[\033[1;92m\]'      # Green
Sh_Color_BIYellow='\[\033[1;93m\]'     # Yellow
Sh_Color_BIBlue='\[\033[1;94m\]'       # Blue
Sh_Color_BIPurple='\[\033[1;95m\]'     # Purple
Sh_Color_BICyan='\[\033[1;96m\]'       # Cyan
Sh_Color_BIWhite='\[\033[1;97m\]'      # White

# Высоко Интенсивные фоновые
Sh_Color_On_IBlack='\[\033[0;100m\]'   # Black
Sh_Color_On_IRed='\[\033[0;101m\]'     # Red
Sh_Color_On_IGreen='\[\033[0;102m\]'   # Green
Sh_Color_On_IYellow='\[\033[0;103m\]'  # Yellow
Sh_Color_On_IBlue='\[\033[0;104m\]'    # Blue
Sh_Color_On_IPurple='\[\033[0;105m\]'  # Purple
Sh_Color_On_ICyan='\[\033[0;106m'    # Cyan
Sh_Color_On_IWhite='\[\033[0;107m'   # White

function parse_git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
    if [[ $EUID -ne 0 ]]; then
        PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}${Sh_Color_BGreen}\u${Sh_Color_Off}@${Sh_Color_BCyan}\H${Sh_Color_Off}:${Sh_Color_BYellow}\w${Sh_Color_Off} ${Sh_Color_BPurple}#${Sh_Color_Off} \[\033[33m\]\$(parse_git_branch)\[\033[00m\] "
    else 
        PS1="${Sh_Color_BRed}\u${Sh_Color_Off}@${Sh_Color_BCyan}\H${Sh_Color_Off}:${Sh_Color_BYellow}\w${Sh_Color_Off} ${Sh_Color_BPurple}#${Sh_Color_Off} "
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias chmod="chmod -v"
alias cp="cp -v"
alias rm="rm --interactive=once -v"
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

if [ -d ~/.rbenv/bin ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    if [ -d ~/.rbenv/plugins/ruby-build/bin ]; then
        export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
    fi
fi
if [ -d ~/.nvm ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nv
fi

export EASYRSA_KEY_SIZE=4096
export EDITOR=nano
# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'
export LESS_TERMCAP_ue=$'\E[0m'
export HISTTIMEFORMAT="%t%d.%m.%y %H:%M:%S%t"
export HISTFILESIZE=9999999999

