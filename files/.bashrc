# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
platform=`uname`

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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
#force_color_prompt=yes

# NOTE: This is a hack
if [ -n "$DYLD_FALLBACK_LIBRARY_PATH" ]; then
    DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:/User/saratt/lm-vfp/intersect/thirdparty/vlfeat-0.9.16/bin/maci64
else
    DYLD_FALLBACK_LIBRARY_PATH=/User/saratt/lm-vfp/intersect/thirdparty/vlfeat-0.9.16/bin/maci64
fi
export DYLD_FALLBACK_LIBRARY_PATH


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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# temporary aliases. DELETE them after expiration
#alias sarat="cd ~/Documents/Intersect/"
#alias sarat="cd ~/lm-backend/www/ && source ~/Software/pythonVirtualEnvs/livemagic/bin/activate"
#alias vfp="cd ~/lm-vfp/tools/markup_tool/"
alias sarat="cd ~/lm-vfp/intersect/tools/vfp/"
alias boost="cd ~/Desktop/pyboost/projects/"
alias vfp="cd ~/lm-vfp/vfp/"
alias tools="cd ~/lm-vfp/intersect/tools/"
alias optvfp="cd /opt/vfp/"
alias lmcode="cd ~/lm-code/dj_www/ && source ~/Software/pythonVirtualEnvs/livemagic/bin/activate"
alias intersect="source ~/Software/intersect_venv/bin/activate && cd ~/Documents/Intersect/intersect"
alias markdown="/Applications/Mou.app/Contents/MacOS/Mou"

alias python3="python3.3"

#default x11 forwarding
#alias ssh="ssh -X"
alias push="bash .push.sh"

#list all directory contents
alias lsa="ls -a"

# The day will come, when this will bite me back
alias sl="ls"
alias lls="clear && ls"

#common ssh
alias livemagic.tv="ssh saratt@replaydev.livemagic.tv"
alias saratxps="ssh -X saratt@saratxps.myftp.biz"
alias sarattallamraju.com="ssh -X saratta1@sarattallamraju.com"

alias ndk-build="/opt/android-ndk-r7b/ndk-build"
alias rsync="rsync --progress"
alias cleandir="rm *.pyc"

alias ..="cd .."
alias documents="cd ~/Documents"
alias root="cd ../../../../../../"
alias downloads="cd ~/Downloads"
alias permission="stat -c '%A %a %n'"
alias extract="tar xvzf"
alias filesize="du -hs"
alias :q="exit"
alias opennlp="~/Documents/Intersect/src/util/opennlp_bin/bin/opennlp"
alias virtualenvlivemagic="source ~/Software/pythonVirtualEnvs/livemagic/bin/activate"
#alias open="gnome-open"
alias haraka="/home/saratt/bin/haraka"
alias django="ipython manage.py $1"
set -o emacs





#add time column to history
#export HISTTIMEFORMAT='%F %T '
History () {
history | awk -v B=`tput smso` -v N=`tput rmso` '{$1= B $1 N} {$2= B $2 N} {$3= B $3 N} {print}'
history
}


#goes to topmost directory found
function goto()
{
  path=`find ~ -iname $1 | head -n 1`
  if [ -d "${path}" ]; then
    echo "";
  else
    path=${path%/*};
  fi
  cd $path
}

#displays contents after cd'ing into it
function cd()
{
  param=$* 2> /dev/null
  if [$param -eq "" 2> ~/.error_log]; then
    builtin cd ~/ 2> ~/.error_log && ls
  else
    builtin cd $param && ls
  fi
}


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Set keyboard rate
# xset r rate 200 111

if [ "$platform" == 'Darwin' ]; then

  # MAC OSX Specific commands

  #for MAC OSX only
  function exitt()
  {
    #osascript -e 'tell application "Terminal" to quit'
    exit
  }

  function activateVirtualEnv()
  {
    path="~/Software/pythonVirtualEnvs/$1"; 
    echo $path;
    if [ -d "${path}" ]; then
      echo "The directory exists";
    else
      #virtualenv ~/Software/pythonVirtualEnvs/$1;
      echo "New Virtualenv Created";
    fi
    #source "$path/bin/activate";
    
  }

  alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=Library/Application\ Support/Google/Chrome/Default/"
  alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
  #eqv of find . -iname "<str>"
  alias search="find . -iname "$1""

  export CLICOLOR=1
  export LSCOLORS=GxFxCxDxBxegedabagaced


  # Setting PATH for Python 2.7
  # The orginal version is saved in .bash_profile.pysave
  #PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
  #export PATH

  export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

  ##
  # Your previous /Users/saratt/.bash_profile file was backed up as /Users/saratt/.bash_profile.macports-saved_2012-06-27_at_14:09:41
  ##

  # MacPorts Installer addition on 2012-06-27_at_14:09:41: adding an appropriate PATH variable for use with MacPorts.
  export PATH=/opt/local/bin:/opt/local/sbin:$PATH
  #export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/bin:$PATH
  export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
  # Finished adapting your PATH environment variable for use with MacPorts.

  # enable bash completion
  #if [ -f `brew --prefix`/etc/bash_completion ]; then
  #    . `brew --prefix`/etc/bash_completion
  #fi

  #up key autocompletes based on history, 
  #bind '"\e[A": history-search-backward'
  #bind '"\e[A": history-search-backward'
  #bind '"\e[B": "\C-k \C-u"'



fi
