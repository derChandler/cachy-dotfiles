function nvwatch
    if not type -q nvidia-smi
        echo "Error: nvidia-smi is not available on this system."
        return 1
    end
    watch -t -n 1 -x fish -c "_nvwatch_display | column -s, -t"
end
