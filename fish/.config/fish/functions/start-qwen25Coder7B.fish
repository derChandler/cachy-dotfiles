function start-qwen25Coder7B --description 'Klassischer llama.cpp Start für Qwen2.5-Coder-7B-Instruct-128K-GGUF'
    #set -l MODEL_PATH "/opt/llama.cpp/models/unsloth/Qwen2.5-Coder-7B-Instruct-128K-GGUF/Qwen2.5-Coder-7B-Instruct-Q8_0.gguf"

    echo "======================================================================="
    echo "🚀 Starte llama.cpp API-Server für Pi Agent"
    echo "📦 Modell: Qwen2.5-Coder-7B-Instruct-128K-GGUF (Klassischer Modus, ohne MTP)"
    echo "======================================================================="
    
    llama-server \
 #     -m $MODEL_PATH \
      -hf Qwen/Qwen2.5-Coder-7B-Instruct-GGUF:Q4_K_M \
      --jinja \
      -fa on \
      -c 0 \
      --parallel 1 \
      --temp 0.6 \
      --top-p 0.95 \
      --top-k 20 \
      --min-p 0.0 \
      --presence-penalty 0.0 \
      --repeat-penalty 1.0 \
      --host 0.0.0.0 \
      --port 8081

end
