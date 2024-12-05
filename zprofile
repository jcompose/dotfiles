#                __               
#  ____   _____ / /_   _____ _____
# /_  /  / ___// __ \ / ___// ___/
#  / /_ (__  )/ / / // /   / /__  
# /___//____//_/ /_//_/    \___/  
#
# © 2024 Jackson Carroll

HISTFILE=~/.histfile # Save the history to a file
HISTSIZE=1000 # Save the last 1000 commands
SAVEHIST=1000 # Save the last 1000 commands
unsetopt beep # Disable the beep
bindkey -e  # sets the keymap mode to emacs
autoload -Uz compinit && compinit # Load zsh completion
source /home/jackson/.config/zsh/command-not-found.plugin.zsh # This shows the prompt to install a command when it's not found on the system
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case insensitive completion

# Man page colors
export GROFF_NO_SGR=1                   # Colored man pages will not work without this (FIXME: WHY???)
export LESS_TERMCAP_md=$'\e[1;36m' 		  # Start bold
export LESS_TERMCAP_so=$'\e[1;32m' 		  # Start standout
export LESS_TERMCAP_us=$'\e[1;35m' 		  # Start underline
export LESS_TERMCAP_mb=$'\e[1:36m' 		  # Start blink
export LESS_TERMCAP_me=$'\e[0m' 		    # Stop bold, blink, and underline
export LESS_TERMCAP_se=$'\e[0m' 		    # Stop standout
export LESS_TERMCAP_ue=$'\e[0m' 		    # Stop underline

export PATH="/home/jackson/.local/bin:$PATH"  # Custom programs
export PAGER="less"
export EDITOR="nvim"

# Gruvbox Color Scheme
export GRUV_RED="#fb4934"
export GRUV_ORANGE="#fe8019"
export GRUV_YELLOW="#fabd2f"
export GRUV_GREEN="#b8bb26"
export GRUV_CYAN="#8ec07c"
export GRUV_BLUE="#83a598"
export GRUV_PURPLE="#d3869b"
export GRUV_WHITE="#ebdbb2"
export GRUV_BLACK="#282828"

# Prompt
export PROMPT=$'%{\e[1;31m%}[%{\e[0;33m%}%n%{\e[0;32m%}@%{\e[0;36m%}%m %{\e[0;35m%}%~%{\e[1;31m%}]%{\e[0m%} $ '

# These are for SDL to work on M1 Mac
if [[ "$OSTYPE" == "darwin" ]]; then
  BREW_PREFIX=$(brew --prefix)
  export LD_LIBRARY_PATH="$BREW_PREFIX/lib:$LD_LIBRARY_PATH" 	# Static libraries
  export LIBRARY_PATH="$BREW_PREFIX/lib:$LIBRARY_PATH" 		# Dynamic libraries
  export CPATH="$BREW_PREFIX/include:$CPATH" 			# C header files
  export CPATH="/opt/local/include:$CPATH" 			# C header files
fi

# Aliases (Oneliners)
alias ls="eza -lh --color=auto --group-directories-first"
alias tree="eza -lhR --color=auto --group-directories-first | less"
alias ll="eza -Alh --color=auto --group-directories-first"
alias ff="clear && jfetch && ls"
alias cat="bat"
alias df="df -h"
alias sc="sudo systemctl"
alias jc="journalctl -b"
alias jcx="journalctl -b -xeu"
alias scu="systemctl --user"
alias scdr="systemctl daemon-reload"
alias sp="sudo pacman"
alias purge="pacman -Qdtq | sudo pacman -Rns -"
alias py="python3"
alias addexifdata="sudo exiftool -d '%s' -tagsfromfile '%d/%F.json' -description -title '-gpslatitude<GeoDataLatitude' '-gpslatituderef<GeoDataLatitude' '-gpslongitude<GeoDataLongitude' '-gpslongituderef<GeoDataLongitude' '-DateTimeOriginal<PhotoTakenTimeTimestamp' '-FileCreateDate<PhotoTakenTimeTimestamp' '-FileModifyDate<PhotoTakenTimeTimestamp' -overwrite_original -ext '*' -r --ext json ."
alias ..="cd .."
alias nn="nvim"
alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias i="incus"
alias ie="incus exec"
alias in="incus network"
alias il="incus list"
