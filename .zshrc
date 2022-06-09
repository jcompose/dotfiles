
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jackson/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export LESS_TERMCAP_md=$'\e[1;36m' 		# Start bold
export LESS_TERMCAP_so=$'\e[1;33m' 		# Start standout
export LESS_TERMCAP_us=$'\e[1;32m' 		# Start underline
export LESS_TERMCAP_me=$'\e[0m' 		# Stop bold, blink, and underline
export LESS_TERMCAP_se=$'\e[0m' 		# Stop standout
export LESS_TERMCAP_ue=$'\e[0m' 		# Stop underline

# Scripts
export PATH="$PATH:$HOME/bin"

export TERMINAL="alacritty"

# Aliases
alias vi="nvim"
alias vim="nvim"
alias ls="ls --color=auto"
alias ll="ls -Al --color=auto"
alias ff="fastfetch"
alias vault="cd ~/Documents/Vault"
alias groceries="vim ~/Documents/Vault/TODO/Groceries.md"
alias readme="cat README.md | less"
alias today="vim ~/Documents/Vault/Journal/$(date +%Y_%m_%d).md"
alias yesterday="vim ~/Documents/Vault/Journal/$(date --date='yesterday' +%Y_%m_%d).md"

# TODO aliases
alias summer="vim ~/Documents/Vault/TODO/Summer.md"
alias todo="vim ~/Documents/Vault/TODO/Today.md"

# Start!
PROMPT=$'%{\e[1;31m%}[%{\e[0;33m%}%n%{\e[0;32m%}@%{\e[0;36m%}%m %{\e[0;35m%}%~%{\e[1;31m%}]%{\e[0m%} $ '
fastfetch