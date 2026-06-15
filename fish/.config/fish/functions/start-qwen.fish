function start-qwen --description 'Llama.cpp Start mit nativem Reasoning und Budget-Message'
    set -l MODEL_PATH "/opt/llama.cpp/models/unsloth/Qwen3.6-35B-A3B-GGUF/Qwen3.6-35B-A3B-UD-Q4_K_M.gguf"

    # 1. Argumente parsen
    argparse 'b/reasoning-budget=' -- $argv
    or return 1

    # Standard-Setup: Wenn kein Budget übergeben wird, schalten wir Reasoning nativ AUS
    set -l reasoning_flag "--reasoning off"
    set -l budget_flags ""
    set -l status_text "Komplett AUS (Nativ via --reasoning off für maximalen Speed)"

    # 2. Wenn ein Budget übergeben wurde und größer als 0 ist:
    if set -q _flag_reasoning_budget; and test "$_flag_reasoning_budget" -gt 0
        set reasoning_flag "--reasoning on"
        # Budget setzen UND die clevere Überleitungs-Nachricht injizieren, um Abwürgen zu verhindern
        set budget_flags "--reasoning-budget $_flag_reasoning_budget --reasoning-budget-message 'OK, I have thought long enough. Let\'s answer now.'"
        set status_text "AN mit $_flag_reasoning_budget Tokens + Budget-Message (Nativ via --reasoning on)"
    end

    echo "======================================================================="
    echo "🚀 Starte llama.cpp API-Server für Pi Agent"
    echo "📦 Modell: Qwen3.6-35B-A3B-UD"
    echo "🧠 Reasoning-Modus: $status_text"
    echo "======================================================================="
    
    # eval sorgt dafür, dass die verketteten $budget_flags sauber expandiert werden
    eval llama-server \
      -m $MODEL_PATH \
      --fit on \
      --fit-ctx 262144 \
      --fit-target 725 \
      -np 1 \
      -fa on \
      --no-mmap \
      --mlock \
      -b 2048 \
      -ub 2048 \
      -ctk q8_0 \
      -ctv q8_0 \
      --temp 0.6 \
      --top-p 0.95 \
      --top-k 20 \
      --min-p 0.0 \
      --presence-penalty 0.0 \
      --repeat-penalty 1.0 \
      $reasoning_flag \
      $budget_flags \
      --host 0.0.0.0 \
      --port 8081 \
      --ctx-checkpoints 256 \
      --context-shift \
      --kv-unified 
end
