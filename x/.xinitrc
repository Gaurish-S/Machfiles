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

# Compositor
picom -f &

# wallpaper
feh --bg-scale Downloads/3840x2160-dark-archlinux2.png &

# cursor
xsetroot -cursor_name left_ptr &

# brightness
xbacklight -set 35 &

# systemd
systemctl enable ntpd.service &
systemctl start ntpd.service &
hwclock --systohc &


# resolution and refreshrate
xrandr --output eDP1 --mode 3840x2160 --rate 60.01 &

# default browser
xdg-settings set google-chrome-stable

# some key remaps
xmodmap -e 'clear Lock' & #ensures you're not stuck in CAPS on mode
xmodmap -e 'keycode 0x42=Escape' & #remaps the keyboard so CAPS LOCK=ESC

# Execute bspwm
sxhkd -c ~/.config/sxhkd/sxhkdrc &
exec bspwm
