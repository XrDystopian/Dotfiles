# --- fzf shell integration (completion + keybindings) ---
eval "$(fzf --zsh)"

# --- Theme ---
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4 \
--height=60% --layout=reverse --border=rounded --info=inline"

# --- CTRL-R: history search ---
export FZF_CTRL_R_OPTS="\
--reverse \
--preview 'echo {}' --preview-window down:3:wrap:hidden \
--bind 'ctrl-/:toggle-preview' \
--bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort' \
--color header:italic \
--header 'CTRL-/: toggle preview | CTRL-Y: copy command'"

# --- CTRL-T: file/dir picker ---
export FZF_CTRL_T_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :100 {}'"

# --- ALT-C: cd picker ---
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_OPTS="--preview 'eza -T --level=2 --icons --color=always {}'"
