# Locale
export LC_ALL=en_US.UTF-8
export LANG="en_US"

# Do not overwrite files when redirecting using ">". Note that you can still override this with ">|"
set -o noclobber

# Prepend $PATH without duplicates
function _prepend_path() {
	if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
		PATH="$1:$PATH"
	fi
}

# Construct $PATH
PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
[ -d /usr/local/bin ] && _prepend_path "/usr/local/bin"
[ -d /usr/local/sbin ] && _prepend_path "/usr/local/sbin"
[ -d /usr/local/heroku/bin ] && _prepend_path "/usr/local/heroku/bin"
[ -d /usr/local/opt/ruby/bin ] && _prepend_path "/usr/local/opt/ruby/bin"
[ -d /usr/local/share/npm/bin ] && _prepend_path "/usr/local/share/npm/bin"
[ -d /usr/local/opt/coreutils/libexec/gnubin ] && _prepend_path "/usr/local/opt/coreutils/libexec/gnubin"
[ -d ~/Dropbox/DOTFILES/bin ] && _prepend_path "$HOME/Dropbox/DOTFILES/bin"
[ -d ~/bin ] && _prepend_path "$HOME/bin"
[ -d ~/.composer/vendor/bin ] && _prepend_path "$HOME/.composer/vendor/bin"
export PATH

export PATH=/usr/local/php5/bin:$PATH

export EDITOR='mvim'

# Homebrew install badge: beer sucks, coffee rules
export HOMEBREW_INSTALL_BADGE='☕'

# Oh My Zsh
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Theme.
ZSH_THEME="cloud"
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
# Format of command execution time stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"
# Custom custom folder
ZSH_CUSTOM="$HOME/Dropbox/DOTFILES/zsh"
# Plugins (see ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(brew bower cake catimg command-not-found composer common-aliases encode64 jsontools tmux git autojump coffee npm osx sublime extract colored-man-pages emoji-clock colorize git-extras git-flow thefuck vagrant zsh-syntax-highlighting)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh ]]

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
