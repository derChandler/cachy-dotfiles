function dev --description 'Lädt das JSON-Layout in einen neuen Tab des aktuellen Fensters'
    if not type -q konsole
        echo "Error: 'konsole' is not available on this system."
        return 1
    end

    set layout_file "$HOME/.local/share/konsole/development.json"
    
    if not test -f $layout_file
        echo "Fehler: Layout-Datei nicht gefunden unter $layout_file"
        return 1
    end

    # 1. Prüfen, ob wir uns bereits in einer Konsole-Session befinden
    if test -n "$KONSOLE_VERSION" -o -n "$KONSOLE_DBUS_WINDOW"
        # 2. Über D-Bus das aktuelle Fenster anweisen, das Layout zu laden.
        # Das öffnet die JSON-Struktur automatisch als neue Tab-Umgebung im selben Fenster.
        qdbus6 $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_WINDOW org.kde.konsole.Window.loadLayout $layout_file
    else
        # Falls von außerhalb aufgerufen (z.B. Yakuake oder KRunner), neues Fenster öffnen
        konsole --layout $layout_file & disown
    end
end
