#!/bin/sh

# A dmenu wrapper script for system functions.
export WM="dwm"
case "$(readlink -f /sbin/init)" in
    *systemd*) ctl='systemctl' ;;
    *) ctl='loginctl' ;;
esac

wmpid(){ # This function is needed if there are multiple instances of the window manager.
    tree="$(pstree -ps $$)"
    tree="${tree#*$WM(}"
    echo "${tree%%)*}"
}

lock(){
    slock
}

case "$(printf " lock\n reboot\n shutdown\n sleep\n " | dmenu -i -p 'Action: ')" in
    ' lock') lock ;;
    ' reboot') $ctl reboot -i ;;
    ' shutdown') $ctl poweroff -i ;;
    *) exit 1 ;;
esac
