# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Better History behavior
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
history() {
	fc -li 1
}

# Don't add duplicate lines or lines beginning with a space to the history
HISTCONTROL=ignoreboth

# Set cursor to blinking vertical line
echo -ne '\e[5 q'

# Keep blinking line cursor on every prompt
autoload -Uz add-zsh-hook
_set_cursor_beam() { echo -ne '\e[5 q'; }
add-zsh-hook precmd _set_cursor_beam

# Useful completion
autoload -Uz compinit
compinit

# Don't beep
unsetopt BEEP

export EDITOR="nvim"
export VISUAL="nvim"


# Keep standard shell keybindings (prevent $EDITOR="nvim" from enabling vi mode)
bindkey -e
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '^?' backward-delete-char

# Aliases
alias gay="agy"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'

## Functions

# Show a directory listing when using 'cd'
function cd() {
	new_directory="$*";
	if [ $# -eq 0 ]; then
		new_directory=${HOME};
	fi;
	builtin cd "${new_directory}" && /bin/ls -lhF --time-style=long-iso --color=auto --ignore=lost+found
}
# Show file listing when using 'pushd'
function pushd() {
    builtin pushd "$@" && /bin/ls -lhF --time-style=long-iso --color=auto --ignore=lost+found
}

function extract() {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjvf "$1"    ;;
      *.tar.gz)    tar xzvf "$1"    ;;
      *.tar.xz)    tar xvf "$1"     ;;
      *.bz2)       bzip2 -d "$1"    ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       7z x "$1"   ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *.ace)       unace x "$1"     ;;
      *)           echo "'$1' cannot be extracted via extract()"   ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function tree() {
    if command -v eza > /dev/null 2>&1; then
        eza -lhF --group --tree --time-style=long-iso --color=auto --ignore-glob='lost+found'
    else
        command tree
    fi
}



# Created by `pipx` on 2026-09-12 06:10:26
export PATH="$PATH:/home/chiphan/.local/bin"
export PATH="$HOME/.local/bin:$PATH"


# Added by Antigravity CLI installer
export PATH="/home/chiphan/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# Starship prompt
# eval "$(starship init zsh)"
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/kali.omp.json)"

# Custom highlight colors matching Starship Nord palette
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=#a3be8c,bold'         # Valid command (Nord green)
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#bf616a,bold'   # Unknown/invalid command (Nord red)
ZSH_HIGHLIGHT_STYLES[alias]='fg=#88c0d0'                # Alias (Nord blue3)
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#81a1c1'              # Built-in command (Nord blue2)
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ebcb8b' # Short flag, e.g. -la (Nord yellow)
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#ebcb8b' # Long flag, e.g. --help (Nord yellow)

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto start tmux when open terminal

if [ -z "$TMUX" ]; then
    tmux attach-session -t default || tmux new-session -s default
fi
