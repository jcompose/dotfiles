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

export PATH="$PATH:$HOME/bin" 								# Include my own scripts in the path
export TERMINAL="alacritty"									# Used for BSPWM I think
export TERM="alacritty"										# Used for xdg-open I think
export BW_CLIENTID="$(cat ~/.api_keys/BW_CLIENTID)"			# Used for automatic BW usage
export BW_CLIENTSECRET="$(cat ~/.api_keys/BW_CLIENTSECRET)"	# Used for automatic BW usage
export BW_PASSWORD="$(cat ~/.api_keys/BW_PASSWORD)"			# Used for automatic BW usage

# Aliases
alias vi="nvim"
alias vim="nvim"
alias ls="ls --color=auto"
alias ll="ls -Al --color=auto"
alias ff="fastfetch"
alias vault="cd ~/Vault"
alias groceries="vim ~/Vault/TODO/Groceries.md"
alias readme="cat README.md | less"
alias today="vim ~/Vault/Journal/$(date +%Y_%m_%d).md"
alias yesterday="vim ~/Vault/Journal/$(date --date='yesterday' +%Y_%m_%d).md"

# TODO list aliases
alias summer="vim ~/Vault/TODO/Summer.md"
alias todo="vim ~/Vault/TODO/Today.md"

# Start!
PROMPT=$'%{\e[1;31m%}[%{\e[0;33m%}%n%{\e[0;32m%}@%{\e[0;36m%}%m %{\e[0;35m%}%~%{\e[1;31m%}]%{\e[0m%} $ '
fastfetch
