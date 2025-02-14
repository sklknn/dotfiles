# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Zinit config

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

# YOOOO PWLVL10K
zinit ice depth=1; zinit light romkatv/powerlevel10k

# syntax highlighting 
zinit light zsh-users/zsh-syntax-highlighting

#snippets 
zinit snippet OMZP::git 
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# zsh autocomplete
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit

zinit cdreplay -q

#fzf tab 
zinit light Aloxaf/fzf-tab

#zsh autosuggestions 
zinit light zsh-users/zsh-autosuggestions

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Keybindings 
bindkey '^f' autosuggest-accept
bindkey '^k' history_search-backward
bindkey '^j' history_search_forward

#History 
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE 
HISTDUP=erase 
setopt appendhistory 
setopt sharehistory 
setopt hist_ignore_space 
setopt hist_ignore_all_dups 
setopt hist_save_no_dups 
setopt hist_ignore_dups 
setopt hist_find_no_dups 

#Styling
zstyle ':completion:*' master-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion"*' menu no 

#Alias
alias ls='ls --color'
alias vi='nvim'
alias cd='z'
alias fastfetch='clear && fastfetch --logo ~/.config/hypr/avatar.png --logo-width 20 --logo-height 10'

#Shell integrations 
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

export PATH=$PATH:/home/sklknn/.spicetify
