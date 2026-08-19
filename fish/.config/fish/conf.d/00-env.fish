set -gx EDITOR nvim
set -gx BAT_THEME "Catppuccin Mocha"
set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.spicetify

# --- Colorize manpages ---
set -gx LESS_TERMCAP_mb (printf '\e[1;31m')
set -gx LESS_TERMCAP_md (printf '\e[1;31m')
set -gx LESS_TERMCAP_me (printf '\e[0m')
set -gx LESS_TERMCAP_se (printf '\e[0m')
set -gx LESS_TERMCAP_so (printf '\e[1;33;44m')
set -gx LESS_TERMCAP_ue (printf '\e[0m')
set -gx LESS_TERMCAP_us (printf '\e[4;1;32m')
set -gx LESS_TERMCAP_mr (printf '\e[7m')
set -gx LESS_TERMCAP_mh (printf '\e[2m')
set -gx LESS_TERMCAP_ZN (printf '\e[74m')
set -gx LESS_TERMCAP_ZV (printf '\e[75m')
set -gx LESS_TERMCAP_ZO (printf '\e[73m')
set -gx LESS_TERMCAP_ZW (printf '\e[75m')
set -gx MANPAGER less
set -gx GROFF_NO_SGR 1
