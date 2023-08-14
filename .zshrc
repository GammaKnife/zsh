############################################
# ███████╗░██████╗██╗░░██╗██████╗░░█████╗░ #
# ╚════██║██╔════╝██║░░██║██╔══██╗██╔══██╗ #
# ░░███╔═╝╚█████╗░███████║██████╔╝██║░░╚═╝ #
# ██╔══╝░░░╚═══██╗██╔══██║██╔══██╗██║░░██╗ #
# ███████╗██████╔╝██║░░██║██║░░██║╚█████╔╝ #
# ╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░ #
############################################

# █▀ █▀█ █░█ █▀█ █▀▀ █▀▀
# ▄█ █▄█ █▄█ █▀▄ █▄▄ ██▄

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ▄▀█ █░░ █ ▄▀█ █▀
# █▀█ █▄▄ █ █▀█ ▄█

# Find all alias's
. ~/.config/zsh/zshalias


# ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀
# ░█░ █▀█ ██▄ █░▀░█ ██▄

# Prompt and color settings
. ~/.config/zsh/zshtheme


# █▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
# █▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

# Additional Funcitons
. ~/.config/zsh/zshfunctions


# Default programs
export EDITOR="nvim"
export VISUAL="nvim"


# █▀▀ █▀█ █▀▄▀█ █▀█ █ █▄░█ █▀ ▀█▀ ▄▀█ █░░ █░░
# █▄▄ █▄█ █░▀░█ █▀▀ █ █░▀█ ▄█ ░█░ █▀█ █▄▄ █▄▄

zstyle :compinstall filename '/home/user/.zshrc'
autoload -Uz compinit
compinit


# █░█ █ █▀ ▀█▀ █▀█ █▀█ █▄█
# █▀█ █ ▄█ ░█░ █▄█ █▀▄ ░█░

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000


# █▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀
# ▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█
unsetopt beep

 
# █░█ █ █▀▄▀█
# ▀▄▀ █ █░▀░█

# Enable Vi mode
bindkey -v

# Remove mode switching delay 
KEYTIMEOUT=5

# Change cursor shape for different vi modes
function zle-keymap-select {
  # Change to solid block curser
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  # Change to line beam curser
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}

# Start shell with line beam curser
function zle-line-init() {
    echo -ne "\e[6 q"
}

# Load Line editor 
zle -N zle-line-init
zle -N zle-keymap-select

