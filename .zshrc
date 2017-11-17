export EDITOR='vim'

if [ "$(uname 2> /dev/null)" != "Linux" ]
then
	# Setting PATH for Python 3.5
	# The orginal version is saved in .bash_profile.pysave
	PATH="~/android-sdk-macosx/tools:~/android-sdk-macosx/platforms:~/android-sdk-macosx/platform-tools:/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

	NDK="/Users/johanneschristenson/android-ndk-r10d"
	export NDK
	ANDROID_NDK="/Users/johanneschristenson/android-ndk-r10d"
	export ANDROID_NDK

	QTDIR="/Users/johanneschristenson/Qt/5.7/clang_64"
	export QTDIR

	export PATH="/Users/johanneschristenson/Library/Python//3.6/bin:$PATH"
	export LC_ALL=en_US.UTF-8
	export LANG=en_US.UTF-8

	# Powerline
	if [ -r /Users/johanneschristenson/Library/Python/3.6/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh ]
	then
		source /Users/johanneschristenson/Library/Python/3.6/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
	fi
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

	# gnome-keyring
	export $(gnome-keyring-daemon -s)
else
	# Powerline
	if [ -r /usr/share/powerline/bindings/zsh/powerline.zsh ]
	then
		source /usr/share/powerline/bindings/zsh/powerline.zsh
	fi
	source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fi
# Set up the prompt

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
