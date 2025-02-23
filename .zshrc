#Zinit config

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

# Load starship theme
# line 1: `starship` binary as command, from github release
# line 2: starship setup at clone(create init.zsh, completion)
# line 3: pull behavior same as clone, source init.zsh
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

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
alias ls='eza --color=always --icons=always'
alias vi='nvim'
alias vim='nvim'
alias cd='z'
alias cat='bat'
alias fastfetch='clear && fastfetch'

#Shell integrations 
eval "$(fzf --zsh --preview "bat --color=always --style=numbers --line-range=:500 {}")"
eval "$(zoxide init zsh)"

export PATH=$PATH:/home/sklknn/.spicetify
