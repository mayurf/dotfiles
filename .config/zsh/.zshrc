zmodload zsh/zprof

mprof() {
  zprof > $HOME/zprof/manual_zsh/$1
}

setopt autocd

export PATH="$PATH:$HOME/c/tools/bin:$HOME/.local/bin:$HOME/c/w/rit/.bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin"
source $ZDOTDIR/envrc
source $ZDOTDIR/aliases
source $ZDOTDIR/zsh_functions
fpath=($ZDOTDIR/functions $fpath)
autoload -Uz $ZDOTDIR/functions/*(:t)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#############################################################################################
# Commenting this for now to profile. Will uncomment later to check difference in performance
#############################################################################################
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

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
smartcache eval direnv hook zsh
smartcache eval zoxide init zsh
smartcache eval atuin init zsh --disable-up-arrow

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="/Users/mayurf/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
