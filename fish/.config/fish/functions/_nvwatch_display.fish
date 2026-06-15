function _nvwatch_display
    echo (nvidia-smi --query-gpu=name --format=noheader)
    echo "-"
    echo "USE, RES, FREE, TOTAL"
    nvidia-smi --query-gpu=memory.used,memory.reserved,memory.free,memory.total --format=csv,noheader
    echo "-"
    echo "TEMP, POWER"
    nvidia-smi --query-gpu=temperature.gpu,power.draw --format=csv,noheader
end
