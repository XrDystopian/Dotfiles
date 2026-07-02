# --- Environment ---
export EDITOR="nvim"
export BAT_THEME="Catppuccin Mocha"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# --- PATH ---
path=(
  $HOME/.local/bin
  $HOME/.cargo/bin
  $HOME/.spicetify
  $path
)
export PATH

# --- fzf Theme ---
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

# --- Colorize manpages ---
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33;44m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[4;1;32m'
export LESS_TERMCAP_mr=$'\e[7m'
export LESS_TERMCAP_mh=$'\e[2m'
export LESS_TERMCAP_ZN=$'\e[74m'
export LESS_TERMCAP_ZV=$'\e[75m'
export LESS_TERMCAP_ZO=$'\e[73m'
export LESS_TERMCAP_ZW=$'\e[75m'
export MANPAGER='less'
export GROFF_NO_SGR=1

# --- Aliases ---
alias cd="z"
alias ls="eza -a --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias la="eza -la --icons --group-directories-first"
alias lt="eza -T --icons --group-directories-first"
alias l.="eza -a | grep '^\.'"
alias code="flatpak run com.visualstudio.code"
alias y="yazi"
alias clr="clear"
alias kvim='NVIM_APPNAME="nvim-kickstart" nvim'
alias svim='NVIM_APPNAME="nvim-seth" nvim'
alias knime='GDK_BACKEND=x11 /opt/knime/knime'

# --- QoL: auto-ls on directory change ---
chpwd() {
    [[ "$PWD" != "$HOME" ]] && ls
}

# --- Tools ---
eval "$(atuin init zsh --disable-up-arrow)"
eval "$(zoxide init zsh)"

# superfile: cd on quit
spf() {
    local os=$(uname -s)

    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    elif [[ "$os" == "Darwin" ]]; then
        export SPF_LAST_DIR="$HOME/Library/Application Support/superfile/lastdir"
    fi

    command spf "$@"

    [[ ! -f "$SPF_LAST_DIR" ]] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR"
    }
}

# --- Zinit ---
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    command mkdir -p "$HOME/.local/share/zinit" && \
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# --- Plugins ---
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# --- Prompt (Starship via Zinit) ---
zinit ice as"command" from"gh-r" \
    atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
    atpull"%atclone" src"init.zsh"
zinit light starship/starship

# --- Deno ---
. "/home/XrDystopian/.deno/env"
