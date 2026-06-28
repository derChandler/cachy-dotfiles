# ~/.config/fish/conf.d/cachy_macos.fish

# Prüfen, ob wir auf macOS (Darwin) sind. Wenn nicht, wird die Datei ignoriert.
if test (uname) = "Darwin"

    # -------------------------------------------------------------------
    # Environment & Pfade (macOS-spezifisch)
    # -------------------------------------------------------------------
    # Homebrew für Apple Silicon (M1/M2/M3/M4) aktivieren
    if test -d /opt/homebrew
        /opt/homebrew/bin/brew shellenv | source
    end

    # Standard-Editoren & Visuals
    set -gx EDITOR nano
    set -gx VISUAL code
    set -gx LANG de_DE.UTF-8
    set -gx LC_ALL de_DE.UTF-8

    # Greet-Meldung beim Starten deaktivieren
    set -g fish_greeting

    # -------------------------------------------------------------------
    # Interactive Mode Settings
    # -------------------------------------------------------------------
    if status is-interactive


        # FZF (Command Line Fuzzy Finder) aktivieren

        if type -q fzf
            fzf --fish | source
        end

        # CachyOS-like Teal/Cyan-Vibe Farbpalette für macOS
        set -g fish_color_normal normal
        set -g fish_color_command 00FFD1 --bold
        set -g fish_color_quote 48FF00
        set -g fish_color_redirection FF00D4
        set -g fish_color_end 00A3FF
        set -g fish_color_error FF0055 --bold
        set -g fish_color_param 00E1FF
        set -g fish_color_comment 757575
        set -g fish_color_match --background=purple
        set -g fish_color_selection white --bold --background=brblack
        set -g fish_color_search_match bryellow --background=brblack
        set -g fish_color_history_current --bold
        set -g fish_color_operator 00a6b2
        set -g fish_color_escape 00a6b2
        set -g fish_color_cwd green
        set -g fish_color_cwd_root red
        set -g fish_color_valid_path --underline
        set -g fish_color_autosuggestion 555555
    end

    # -------------------------------------------------------------------
    # Aliases & Shortcuts
    # -------------------------------------------------------------------

    # Eza (Moderner Ersatz für 'ls')
    if type -q eza
        alias ls "eza --icons --group-directories-first"
        alias ll "eza -l --icons --group-directories-first"
        alias la "eza -a --icons --group-directories-first"
        alias lla "eza -la --icons --group-directories-first"
        alias tree "eza --tree --icons"
    end

    # Bat (Moderner Ersatz für 'cat')
    if type -q bat
        alias cat "bat --style=plain"
        alias catp "bat"
    end

    # Navigation
    alias .. "cd .."
    alias ... "cd ../.."
    alias .... "cd ../../.."
    alias ..... "cd ../../../.."

    # System Updates & Pacman-Feeling für den Mac
    alias pacman "brew"
    alias cachy-update "brew update && brew upgrade"

    # Git Shortcuts
    alias g "git"
    alias gs "git status"
    alias ga "git add"
    alias gc "git commit -m"
    alias gp "git push"
    alias gl "git log --oneline --graph --decorate"

    # Utilities
    alias grep "grep --color=auto"
    alias df "df -h"
    alias du "du -sh"
    alias mkdir "mkdir -p"
    alias cp "cp -iv"
    alias mv "mv -iv"
    alias rm "rm -iv"

    # -------------------------------------------------------------------
    # Funktionen
    # -------------------------------------------------------------------

    # Verzeichnis erstellen und direkt hineinspringen
    function mkcd
        mkdir -p $argv
        and cd $argv
    end

    # Schnelles Entpacken von Archiven
    function extract
        if test -f $argv[1]
            switch $argv[1]
                case '*.tar.bz2'; tar xjf $argv[1]
                case '*.tar.gz';  tar xzf $argv[1]
                case '*.bz2';     bunzip2 $argv[1]
                case '*.rar';     unrar x $argv[1]
                case '*.gz';      gunzip $argv[1]
                case '*.tar';     tar xf $argv[1]
                case '*.tbz2';    tar xjf $argv[1]
                case '*.tgz';     tar xzf $argv[1]
                case '*.zip';     unzip $argv[1]
                case '*.Z';       uncompress $argv[1]
                case '*.7z';      7z x $argv[1]
                case '*';         echo "'$argv[1]' kann nicht extrahiert werden"
            end
        else
            echo "'$argv[1]' ist keine gültige Datei"
        end
    end

end