# --- Environment ---
export EDITOR="nvim"
export BAT_THEME="Catppuccin Mocha"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# --- PATHs ---
path=(
  $HOME/.local/bin
  $HOME/.cargo/bin
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

# --- Aliases ---
alias cd="z"
alias ls="eza -a --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias la="eza -la --icons --group-directories-first"
alias lt="eza -T --icons --group-directories-first"
alias l.="eza -a | grep '^\.'"
alias code="flatpak run com.visualstudio.code"
alias y="yazi"
alias seanime="./Seanime/seanime"
alias clr="clear"
alias kvim='NVIM_APPNAME="nvim-kickstart" nvim'
alias svim='NVIM_APPNAME="nvim-seth" nvim'
alias surge='/opt/surge/surge'

# --- Shortcuts/ QoL ---
chpwd() {
    if [[ "$PWD" != "$HOME" ]]; then
        ls
    fi
}

# --- Tools ---
eval "$(atuin init zsh --disable-up-arrow)"
eval "$(zoxide init zsh)"

# --- Zinit Setup ---
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

# --- Prompt ---
zinit ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zinit light starship/starship

export PATH=$PATH:/home/XrDystopian/.spicetify
. "/home/XrDystopian/.deno/env"
