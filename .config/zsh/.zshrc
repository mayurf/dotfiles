zmodload zsh/zprof

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
# Enable Powerlevel10k instant prompt. Must be at the very top.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

setopt autocd
export KEYTIMEOUT=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

path+=(
  $HOME/.cache/.bun/bin
  $HOME/.local/bin
  '/Applications/Sublime Text.app/Contents/SharedSupport/bin'
  $HOME/.lmstudio/bin
  '/Users/mayurf/Library/Application Support/JetBrains/Toolbox/scripts'
)
source $ZDOTDIR/envrc
source $ZDOTDIR/aliases
source $ZDOTDIR/zsh_functions
fpath=($ZDOTDIR/functions $fpath)
autoload -Uz $ZDOTDIR/functions/*(:t)

# Load project-local zsh config from ~/w (and any subdirectory with a .zsh dir)
load-project-zsh "$HOME/w"

source $ZPLUGIN_HOME/ez-compinit/ez-compinit.plugin.zsh

# Manually defined list of active plugins to keep startup tight
plugins=(
  zsh-autosuggestions/zsh-autosuggestions.zsh
  fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
  fzf-tab/fzf-tab.plugin.zsh
  # # TODO source history substring
  # # TODO look into history plugins
)

for plugin in $plugins; do
  [[ -f "$ZPLUGIN_HOME/$plugin" ]] && source "$ZPLUGIN_HOME/$plugin"
done

# # TODO start adding evals here
source $ZDOTDIR/starship_init.zsh
source $ZDOTDIR/mise_init.zsh
source $ZDOTDIR/zoxide_init.zsh
source $ZDOTDIR/atuin_init.zsh
source $ZDOTDIR/wtp_init.zsh

# pnpm
export PNPM_HOME="/Users/mayurf/.local/share/pnpm"
path=($PNPM_HOME $path)
# pnpm end

#zprof
