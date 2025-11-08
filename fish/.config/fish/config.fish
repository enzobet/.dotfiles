
# Set PATH
set -x PATH /usr/local/bin $HOME/.local/bin $PATH

# Set editor
set -U EDITOR nvim


if test -d /opt/homebrew
  set -x PATH /opt/homebrew/bin /opt/homebrew/sbin /opt/homebrew/opt/postgresql@15/bin $PATH
  # Set default shell
  set -U SHELL /opt/homebrew/bin/fish
end

# Starship
starship init fish | source

# Zoxide
zoxide init --cmd cd fish | source

# Pyenv
pyenv init - | source

# Eza
alias ls="eza --icons=always -A"
alias lt="eza --icons=always --tree --color=always --level=3 -A --git-ignore"

# FZF
# Set up fzf key bindings
fzf --fish | source

# --- setup fzf theme ---
set -l fg "#CBE0F0"
set -l bg "#011628"
set -l bg_highlight "#143652"
set -l purple "#B388FF"
set -l blue "#06BCE4"
set -l cyan "#2CF9ED"

set -gx FZF_DEFAULT_OPTS "--color=fg:$fg,bg:$bg,hl:$purple,fg+:$fg,bg+:$bg_highlight,hl+:$purple,info:$blue,prompt:$cyan,pointer:$cyan,marker:$cyan,spinner:$cyan,header:$cyan"

# -- Use fd instead of fzf --

set -gx FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# ---- Eza (better ls) -----

alias ls="eza --icons=always -A"
alias lt="eza --icons=always --tree --color=always --level=3 -A --git-ignore"

# ---- tmuxifier -----

if test -d $HOME/.tmux/plugins/tmuxifier
  set -x PATH $HOME/.tmux/plugins/tmuxifier/bin $PATH
  set -x TMUXIFIER_LAYOUT_PATH $HOME/.config/tmuxifier
  if not test -d $TMUXIFIER_LAYOUT_PATH
    mkdir -p $TMUXIFIER_LAYOUT_PATH
  end
  tmuxifier init - | source
end

# ---- aliases -----

alias nv="nvim"

alias lg="lazygit"
alias gt="git"
alias gtp="gt pull"
alias gtipp="gt push"
alias gtc="gt commit"
alias gta="gt add"

if command -q aws
  alias awsconf="envsource $HOME/.init-scripts/init-aws.env"
  alias a="aws --profile enzo-admin-sso"
  alias ams="aws --profile chemify-org-maryhill-staging-admin-sso --region eu-west-1"
  alias amp="aws --profile chemify-org-maryhill-prod-admin-sso --region eu-west-1"
  alias ampp="aws --profile chemify-org-maryhill-pre-prod-admin-sso --region eu-west-1"
  alias amvpn="aws --profile chemify-org-vpn-services-admin-sso --region eu-west-1"
end

if command -q kubectl
  alias k="kubectl"
  alias ka="k -n argocd"
end

alias cls="clear"

alias tmk="tmux kill-session -t"
alias tmx="tmuxifier load-session"
alias tmxl="tmuxifier list-sessions"
alias tml="tmux list-sessions"
alias tma="tmux a"

# ---- defaults -----
nvm use lts
