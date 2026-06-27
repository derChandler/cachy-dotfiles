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
