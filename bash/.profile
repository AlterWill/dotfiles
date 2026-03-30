export XDG_CURRENT_DESKTOP=sway
export XDG_CURRENT_TYPE=wayland
export GDK_BACKEND=wayland,x11
export QT_QPA_PLATFORM=wayland;xcb
export _JAVA_AWT_WM_NONREPARENTING=1

if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi



# Added by Toolbox App
export PATH="$PATH:/home/alterwill/.local/share/JetBrains/Toolbox/scripts"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
