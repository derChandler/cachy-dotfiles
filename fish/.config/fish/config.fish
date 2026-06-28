source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    smth
#end

starship init fish | source
direnv hook fish | source

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/florian/.lmstudio/bin
# End of LM Studio CLI section

set -x TERMINAL konsole

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Added by Antigravity CLI installer
set -gx PATH "/home/florian/.local/bin" $PATH

# Cusor style block
set -g fish_cursor_default block
set -g fish_cursor_insert block
set -g fish_cursor_replace_one block
set -g fish_cursor_visual block

# Paste with middle Mouse Button 
function fish_user_key_bindings
    bind --mode default \x1b\[M\" paste_from_clipboard
    bind --mode insert \x1b\[M\" paste_from_clipboard
end