#		,---.               ,--.      
#     /  O  \ ,--.--. ,---.|  ,---.  
#   |  .-.  ||  .--'| .--'|  .-.  | 
#  |  | |  ||  |   \ `--.|  | |  | 
# `--' `--'`--'    `---'`--' `--' 

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Man page colors
export LESS_TERMCAP_md=$'\e[1;36m' 		# Start bold
export LESS_TERMCAP_so=$'\e[1;32m' 		# Start standout
export LESS_TERMCAP_us=$'\e[1;35m' 		# Start underline
export LESS_TERMCAP_me=$'\e[0m' 		# Stop bold, blink, and underline
export LESS_TERMCAP_se=$'\e[0m' 		# Stop standout
export LESS_TERMCAP_ue=$'\e[0m' 		# Stop underline
export EDITOR="nvim"

# Aliases
alias ls="ls --color=auto"
alias ll="ls -Al --color=auto"
alias ff="neofetch"
alias nvimc="nvim ~/.config/nvim/init.lua"

# Start!
PROMPT=$'%{\e[1;31m%}[%{\e[0;33m%}%n%{\e[0;32m%}@%{\e[0;36m%}%m %{\e[0;35m%}%~%{\e[1;31m%}]%{\e[0m%} $ '
neofetch
