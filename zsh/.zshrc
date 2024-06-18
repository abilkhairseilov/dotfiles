# set oh-my-posh and themes
_POSH_THEME="/usr/share/oh-my-posh/themes/gruvbox.omp.json"

# set history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt correct                   # Auto correct mistakes
setopt extendedglob              # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                # Case insensitive globbing
setopt rcexpandparam             # Array expension with parameters
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

# set plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
if [[ -r /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
    #export PKGFILE_PROMPT_INSTALL_MISSING=1
fi

## Set key bindings
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey "^[[A" history-substring-search-up                      # Up key
bindkey "^[[B" history-substring-search-down                    # Down key
bindkey ";5A" history-beginning-search-backward                 # Ctrl-Up key
bindkey ";5B" history-beginning-search-forward                  # Ctrl-Down key
bindkey "^[[1;5A" history-beginning-search-backward             # Ctrl-Up key
bindkey "^[[1;5B" history-beginning-search-forward              # Ctrl-Down key

bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action


# set alias 
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias ls='ls --color=auto'                                      # Set colored output of ls
alias rm='trash'
alias undorm='trash-restore'
alias rmlist='trash-list'

# color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

export VISUAL=nvim
export EDITOR=nvim
export KDEWM=/usr/bin/bspwm
export BROWSER=firefox
export FZF_DEFAULT_OPTS="--ansi"
export CARGO_BUILD_JOBS=2

# functions
function pacfind() {
    sudo pacman -Syu
    local search_term="$1"  # Store the argument as a local variable
    if [[ -z "$search_term" ]]; then  # Check if an argument was provided
        paru -Sl | awk '{print $2($4=="" ? "" : " *")}' | fzf --multi --preview 'paru -Si {1}' --reverse | xargs -ro paru -S
    else
        paru -Sl | awk '{print $2($4=="" ? "" : " *")}' | fzf --multi --preview 'paru -Si {1}' --reverse --query="$search_term" | xargs -ro paru -S
    fi
}

function pacrem() {
    local search_term="$1"  # Store the argument as a local variable
    if [[ -z "$search_term" ]]; then  # Check if an argument was provided
        paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -R
    else
        paru -Slq | fzf --multi --preview 'paru -Si {1}' --query="$search_term" | xargs -ro paru -R
    fi
}

export POSH_THEME=${_POSH_THEME}
eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh)"
