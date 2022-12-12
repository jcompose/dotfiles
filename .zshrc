HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
zstyle :compinstall filename '/home/jackson/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

export LESS_TERMCAP_md=$'\e[1;36m' 		# Start bold
export LESS_TERMCAP_so=$'\e[1;33m' 		# Start standout
export LESS_TERMCAP_us=$'\e[1;32m' 		# Start underline
export LESS_TERMCAP_me=$'\e[0m' 		# Stop bold, blink, and underline
export LESS_TERMCAP_se=$'\e[0m' 		# Stop standout
export LESS_TERMCAP_ue=$'\e[0m' 		# Stop underline

# Aliases
alias vi="nvim"
alias vim="nvim"
alias ls="ls --color=auto"
alias ll="ls -Al --color=auto"
alias ff="neofetch"
alias jn="jupyter-notebook"

# Project aliases
alias phys="vim ~/Desktop/PHYSICS\ Final/Cheat_Sheet/main.tex"
alias ge="vim -S ~/Documents/GameEngine/gameengine"
alias az="vim -S ~/Desktop/u\ ^\ n/notes"
alias linalg="vim ~/Desktop/Math/Linear\ Algebra/Notes.tex && open ~/Desktop/Math/Linear\ Algebra/LinAlg.pdf"

# Path
export PATH="/opt/homebrew/opt/ffmpeg@4/bin:$PATH"
export PATH="/Users/jacksontcarroll/bin:$PATH"

# Start!
PROMPT=$'%{\e[1;31m%}[%{\e[0;33m%}%n%{\e[0;32m%}@%{\e[0;36m%}%m %{\e[0;35m%}%~%{\e[1;31m%}]%{\e[0m%} $ '
neofetch
