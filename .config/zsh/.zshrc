zmodload zsh/zprof

mprof() {
  zprof > $HOME/zprof/manual_zsh/$1
}

setopt autocd

export PATH="$PATH:$HOME/.cache/.bun/bin:$HOME/.local/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin"
source $ZDOTDIR/envrc
source $ZDOTDIR/aliases
source $ZDOTDIR/zsh_functions
fpath=($ZDOTDIR/functions $fpath)
autoload -Uz $ZDOTDIR/functions/*(:t)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZPLUGIN_HOME/powerlevel10k/powerlevel10k.zsh-theme

# # To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

source $ZPLUGIN_HOME/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

source $ZPLUGIN_HOME/zsh-smartcache/zsh-smartcache.plugin.zsh

source $ZPLUGIN_HOME/zsh-autosuggestions/zsh-autosuggestions.zsh
# # TODO source history substring
# # TODO look into mattmc3 easy completions
# # TODO look into history plugins

# # TODO start adding evals here
smartcache eval mise activate zsh
source $ZDOTDIR/zoxide_init.zsh
source $ZDOTDIR/atuin_init.zsh
