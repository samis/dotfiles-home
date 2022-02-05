#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
gpg-connect-agent updatestartuptty /bye
# Execute WindowMaker
#exec wmaker > ~/xsession.log 2>&1
# Execute Enlightenment
# exec enlightenment_start > ~/xsession.log 2>&1
# Set the keyboard layout
setxkbmap -layout gb
xrandr --output DisplayPort-1 --mode 2560x1440 --rate 144.00
rm ~/xsession.log
# Run programs
terminology -e weechat >> ~/xsession.log 2>&1 &
firefox >> ~/xsession.log 2>&1 &
thunderbird-bin >> ~/xsession.log 2>&1 &
# Launch GNU Shepherd
shepherd
# Execute awesomeWM
exec awesome >> ~/xsession.log 2>&1
