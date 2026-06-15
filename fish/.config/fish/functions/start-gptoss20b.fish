function start-gptoss20b --description 'Klassischer llama.cpp Start für gpt-oss-20b-GGUF'
    set -l MODEL_PATH "/opt/llama.cpp/models/lmstudio-community/gpt-oss-20b-GGUF/gpt-oss-20b-MXFP4.gguf"

    echo "======================================================================="
    echo "🚀 Starte llama.cpp API-Server für Pi Agent"
    echo "📦 Modell: gpt-oss-20b-MXFP4 (Klassischer Modus, ohne MTP)"
    echo "======================================================================="
    
    llama-server \
      -m $MODEL_PATH \
      --fit on \
      --fit-ctx 134144 \
      --fit-target 512 \
      -np 1 \
      -fa on \
      --no-mmap \
      --mlock \
      -b 2048 \
      -ub 2048 \
      -ctk q8_0 \
      -ctv q8_0 \
      --temp 0.8 \
      --top-p 0.8 \
      --top-k 40 \
      --min-p 0.05 \
      --presence-penalty 0.0 \
      --repeat-penalty 1.1 \
      --reasoning-budget -1 \
      --chat-template-kwargs "{\"preserve_thinking\": true}" \
      --host 0.0.0.0 \
      --port 8081 \
      --swa-full \
      --ctx-checkpoints 256 \
      --context-shift\
      --kv-unified 


end
