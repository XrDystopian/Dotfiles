# --- Starship transient prompt (must be defined BEFORE starship init) ---
function starship_transient_prompt_func
    starship module character
end

starship init fish | source
enable_transience

# --- zoxide ---
zoxide init fish --cmd cd | source

# --- Deno (no fish env file shipped, so set manually) ---
set -gx DENO_INSTALL "$HOME/.deno"
fish_add_path "$DENO_INSTALL/bin"
