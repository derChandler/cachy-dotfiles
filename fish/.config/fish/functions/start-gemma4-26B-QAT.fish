function start-gemma4-26B-QAT --description 'Klassischer llama.cpp Start für gemma-4-26B-A4B-it-qat-UD-Q4_K_XL'

    echo "======================================================================="
    echo "🚀XYZ Starte llama.cpp API-Server für Pi Agent"
    echo "📦 Modell: gemma-4-26B-A4B-it-qat-UD-Q4_K_XL (Klassischer Modus, ohne MTP)"
    echo "======================================================================="
    
    llama-server \
      --hf-repo unsloth/gemma-4-26B-A4B-it-qat-GGUF:UD-Q4_K_XL \
      --fit on \
      --fit-ctx 262144 \
      --fit-target 725 \
      --parallel 1 \
      --flash-attn on \
      --no-mmap \
      --mlock \
      --temp 1.0 \
      --top-p 0.95 \
      --top-k 64 \
      --min-p 0.05 \
      --presence-penalty 0.0 \
      --repeat-penalty 1.1 \
      --reasoning on \
      --reasoning-budget 1000 \
      --reasoning-budget-message 'OK, I have thought long enough. Let\'s answer now.' \
      --chat-template-kwargs "{\"preserve_thinking\": true}" \
      --host 0.0.0.0 \
      --port 8081 \
      --ctx-checkpoints 256 \
      --kv-unified


end
