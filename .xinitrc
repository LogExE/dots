#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

parcellite &
picom &
/usr/lib/geoclue-2.0/demos/agent &
redshift &
hsetroot -solid '#FFD580'
setxkbmap -layout us,ru -option grp:shifts_toggle
emacs --daemon
xrandr --dpi 192 
export MOZ_USE_XINPUT2=1

xmonad

emacsclient -e '(kill-emacs)'
pkill -P $$
