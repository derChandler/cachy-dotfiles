function nvwatch
    watch -t -n 1 -x fish -c "_nvwatch_display | column -s, -t"
end
