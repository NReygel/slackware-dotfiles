# 
# ~/.bashrc: executed by bash for interactive non-Login shells.
# 
# This file is for personal customizations to the bash environment.
# System-wide defaults are generally handled by /etc/profile and
# scripts in /etc/profile.d/.
#
# To source /etc/profile.d/* scripts in graphical terminals
# (which are typically non-Login shells), add a line like: 
#   if [ -f /etc/profile ]; then
#         ./etc/profile
#   fi
#
# Last edit: 13/11/2025 
# Owner: gc@neutron
#

# Test for an interactive shell. There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases
if [[ $- != *i* ]]; then
    # Shell is non-interactive. Be done now!
    return
fi

# General 
export EDITOR=vim
export PATH=$PATH:/sbin:$HOME/bin

# Source .bash_aliases if it exists
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Source .bash_functions if it exists
if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

# Source .bash_colors if it exists
if [ -f ~/.bash_colors ]; then
    . ~/.bash_colors
fi

# Custom PS1 prompt
# No colors: export PS1='[\u@\h \W]\$ '
if [ "$UID" -eq 0 ]; then # Check if we're ROOT
    # ROOT user prompt (Entirely red with # prompt char)
    export PS1="\[$LRED\][\u@\h \W]\#\[$NC\] "
    else
        export PS1="\[$LGRN\][\u\[$LRED\]@\[$LGRN\]\h \W]\$\[$NC\] "
fi


