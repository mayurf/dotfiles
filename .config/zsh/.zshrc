zmodload zsh/zprof

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
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

#zprof
