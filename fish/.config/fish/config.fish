# ~/.config/fish/config.fish

# -------------------------------------------------------------------
# 1. System Specifics & Environment (Linux vs. macOS)
# -------------------------------------------------------------------

# Load local env.fish ONLY if the file actually exists
if test -f ~/.local/bin/env.fish
    source ~/.local/bin/env.fish
end

# Load original CachyOS config ONLY when running on Linux
if test (uname) = "Linux"
    if test -f /usr/share/cachyos-fish-config/cachyos-config.fish
        source /usr/share/cachyos-fish-config/cachyos-config.fish
    end
    
    # Default terminal variable for Linux environments
    set -x TERMINAL ghostty
end

# -------------------------------------------------------------------
# 2. Paths & CLI Tools (Dynamic Home Directory)
# -------------------------------------------------------------------

# LM Studio CLI (Uses $HOME dynamically instead of a hardcoded path)
if test -d $HOME/.lmstudio/bin
    set -gx PATH $PATH $HOME/.lmstudio/bin
end

# Bun Package Manager
set --export BUN_INSTALL "$HOME/.bun"
if test -d $BUN_INSTALL/bin
    set --export PATH $BUN_INSTALL/bin $PATH
end

# Antigravity CLI / Local Binaries
if test -d $HOME/.local/bin
    set -gx PATH "$HOME/.local/bin" $PATH
end

# -------------------------------------------------------------------
# 3. Interactive Mode Settings (Prompts & Keybindings)
# -------------------------------------------------------------------
if status is-interactive

    # Initialize direnv only if the binary is available
    if type -q direnv
        direnv hook fish | source
    end

    # Initialize Starship if available (macOS handles this via cachy_macos.fish)
    if type -q starship
        starship init fish | source
    end

    # Cursor style configuration (Always block mode)
    set -g fish_cursor_default block
    set -g fish_cursor_insert block
    set -g fish_cursor_replace_one block
    set -g fish_cursor_visual block

end

# Paste with middle mouse button (X11/Linux specific, harmless on macOS)
function fish_user_key_bindings
    bind --mode default \x1b\[M\" paste_from_clipboard
    bind --mode insert \x1b\[M\" paste_from_clipboard
end

# Added by Antigravity CLI installer (Cross-platform dynamic path)
if test -d $HOME/.local/bin
    set -gx PATH "$HOME/.local/bin" $PATH
end
