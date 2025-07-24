export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}

export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}
export ZPLUGIN_HOME="$ZDOTDIR/plugins"

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

export PATH="$PATH:/usr/local/bin"


. "$HOME/.cargo/env"
