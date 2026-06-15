function start-gemma4-12b --description 'Klassischer llama.cpp Start für gemma-4-12b-it-UD-Q4_K_XL'

    echo "======================================================================="
    echo "🚀 Starte llama.cpp API-Server für Pi Agent"
    echo "📦 Modell: gemma-4-12b-it-UD-Q4_K_XL (Klassischer Modus, ohne MTP)"
    echo "======================================================================="
    
    llama-server \
      --hf-repo unsloth/gemma-4-12b-it-GGUF:UD-Q4_K_XL \
      --n-gpu-layers 99 \
      --ctx-size 131072 \
      --parallel 1 \
      --flash-attn on \
      --cache-type-k bf16 \
      --cache-type-v bf16 \
      --temp 1.0 \
      --top-p 0.95 \
      --top-k 64 \
      --min-p 0.05 \
      --presence-penalty 0.0 \
      --repeat-penalty 1.1 \
      --reasoning-budget -1 \
      --chat-template-kwargs "{\"preserve_thinking\": true}" \
      --host 0.0.0.0 \
      --port 8081 \
      --ctx-checkpoints 256 \
      --kv-unified


end
