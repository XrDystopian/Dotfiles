# Catppuccin Mocha overrides — ported from zsh-syntax-highlighting /
# zsh-fast-syntax-highlighting configs, on top of catppuccin/fish base theme.
# Loads after 05-theme.fish so these values win.

# --- Palette reference (Catppuccin Mocha) ---
set -l green    a6e3a1
set -l blue     89b4fa
set -l mauve    cba6f7
set -l red      f38ba8
set -l maroon   eba0ac
set -l peach    fab387
set -l yellow   f9e2af
set -l pink     f5c2e7
set -l teal     94e2d5
set -l text     cdd6f4
set -l subtext0 a6adc8
set -l overlay0 6c7086
set -l surface1 45475a
set -l base     1e1e2e

# --- Commands / builtins / functions (green, like your old zsh setup) ---
set -U fish_color_command       $green
set -U fish_color_keyword       $green
set -U fish_color_end           $red        # command separators: ; & |
set -U fish_color_escape        $mauve

# --- Arguments / options ---
set -U fish_color_param         $text       # plain arguments stay normal text
set -U fish_color_option        $peach      # -x / --foo style flags

# --- Valid filepaths: pink + underlined ---
set -U fish_color_param         $text       # base text color for params...
# fish merges fish_color_valid_path on top of param color for recognized paths;
# to get an actual pink (not just underline), also set the dedicated path styling:
set -U fish_color_valid_path    $pink --underline

# --- Quotes / strings ---
set -U fish_color_quote         $yellow

# --- Redirections / operators ---
set -U fish_color_redirection   $teal
set -U fish_color_operator      $pink       # globbing (*, ?, etc.)

# --- Comments ---
set -U fish_color_comment       $overlay0

# --- Errors / invalid tokens ---
set -U fish_color_error         $maroon

# --- Autosuggestions (ghost text) ---
set -U fish_color_autosuggestion $overlay0

# --- Matching brackets / search / selection ---
set -U fish_color_match         --background=$surface1
set -U fish_color_selection     --background=$surface1
set -U fish_color_search_match  --background=$surface1

# --- Cancel indicator ---
set -U fish_color_cancel        $red

# --- Prompt user/host (only relevant if not fully overridden by Starship) ---
set -U fish_color_user          $green
set -U fish_color_host          $blue

# --- Completion pager (Tab menu) ---
set -U fish_pager_color_prefix       $mauve --bold
set -U fish_pager_color_completion   $text
set -U fish_pager_color_description  $overlay0 --italics
set -U fish_pager_color_selected_background --background=$surface1
