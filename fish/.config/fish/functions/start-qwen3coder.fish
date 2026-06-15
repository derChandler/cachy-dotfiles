function start-qwen3coder --description 'Klassischer llama.cpp Start für Qwen3-Coder-30B-A3B-Instruct-Q4_K_M'
    set -l MODEL_PATH "/opt/llama.cpp/models/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF/Qwen3-Coder-30B-A3B-Instruct-Q4_K_M.gguf"
    set -l CHAT_TEMPLATE_FILE "/opt/llama.cpp/models/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF/chat-template.jinja"

    echo "======================================================================="
    echo "🚀 Starte llama.cpp API-Server für Pi Agent"
    echo "📦 Modell: Qwen3-Coder-30B-A3B-Instruct-Q4_K_M (Klassischer Modus, ohne MTP)"
    echo "======================================================================="
    
    llama-server \
      -m $MODEL_PATH \
      --chat-template-file $CHAT_TEMPLATE_FILE \
      --fit on \
      --fit-ctx 262144 \
      --fit-target 512 \
      -np 1 \
      -fa on \
      --no-mmap \
      --mlock \
      -b 2048 \
      -ub 2048 \
      -ctk q8_0 \
      -ctv q8_0 \
      --temp 0.7 \
      --top-p 0.95 \
      --top-k 20 \
      --min-p 0.0 \
      --presence-penalty 0.0 \
      --repeat-penalty 1.05 \
      --reasoning-budget -1 \
      --chat-template-kwargs "{\"preserve_thinking\": true}" \
      --host 0.0.0.0 \
      --port 8081 \
      --swa-full \
      --ctx-checkpoints 256 \
      --context-shift\
      --kv-unified


end


