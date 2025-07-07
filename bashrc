#!/usr/bin/bash
#-----------------------------------------------------------------
# Initialization
#-----------------------------------------------------------------
# Exit if not an interactive shell
case $- in
*i*) ;;
*) return ;;
esac

# Ensure the ~/bin directory exists
readonly bin_dir="${HOME}/bin"
if [[ ! -d "${bin_dir}" ]]; then
  mkdir -p "${bin_dir}"
fi

#-----------------------------------------------------------------
# Style
#-----------------------------------------------------------------
RED=$'\033[31m'
BGRED=$'\033[41m'
GREEN=$'\033[32m'
MAGENTA=$'\033[35m'
CYAN=$'\033[36m'
BLUE=$'\033[34m'
YELLOW=$'\033[33m'
WHITE=$'\033[37m'
NORMAL=$'\033[0m'
BOLD=$'\033[01m'
CLEARLINE=$'\033[K'

#-----------------------------------------------------------------
# Functions
#-----------------------------------------------------------------
function __line {
  printf "${BOLD}${MAGENTA}%*s${NORMAL}\n" "$(tput cols)" '' | tr ' ' '-'
}
export -f __line

function __add_path() {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}
export -f __add_path

function __insert_path() {
  for ((i=$#; i>0; i--));
  do
    ARG=${!i}
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}
export -f __insert_path

#-----------------------------------------------------------------
# History
#-----------------------------------------------------------------
shopt -s histappend
shopt -s cmdhist
export HISTFILE="${HOME}/.bash_eternal_history"
export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTIGNORE="ls"
export HISTTIMEFORMAT="%Y-%m-%d "
export MCFLY_DELETE_WITHOUT_CONFIRM=true
export MCFLY_DISABLE_MENU=false
export MCFLY_FUZZY=2 # 0 == off, 2-5 gets good results
export MCFLY_INTERFACE_VIEW=BOTTOM
export MCFLY_KEY_SCHEME=vim
export MCFLY_LIGHT=false
export MCFLY_PROMPT="❯"
export MCFLY_RESULTS=40
export MCFLY_RESULTS_SORT=LAST_RUN

#-----------------------------------------------------------------
# Terminal Features
#-----------------------------------------------------------------
# shellcheck disable=SC1091
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    source "/usr/share/bash-completion/bash_completion"
shopt -s cdspell 2> /dev/null
shopt -s checkwinsize 2> /dev/null
shopt -s dirspell 2> /dev/null
shopt -s globstar 2> /dev/null
bind 'set completion-ignore-case on'
bind 'set completion-map-case on'
bind 'set show-all-if-ambiguous on'
bind 'set mark-symlinked-directories on'
bind 'TAB:menu-complete'
export EDITOR="nvim"
export VISUAL="nvim"

#-----------------------------------------------------------------
# History
#-----------------------------------------------------------------
shopt -s histappend
shopt -s cmdhist
export HISTFILE="${HOME}/.bash_eternal_history"
export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTIGNORE="ls"
export HISTTIMEFORMAT="%Y-%m-%d "
export MCFLY_DELETE_WITHOUT_CONFIRM=true
export MCFLY_DISABLE_MENU=false
export MCFLY_FUZZY=2 # 0 == off, 2-5 gets good results
export MCFLY_INTERFACE_VIEW=BOTTOM
export MCFLY_KEY_SCHEME=vim
export MCFLY_LIGHT=false
export MCFLY_PROMPT="❯"
export MCFLY_RESULTS=40
export MCFLY_RESULTS_SORT=LAST_RUN

#-----------------------------------------------------------------
# Terminal Features
#-----------------------------------------------------------------
# shellcheck disable=SC1091
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    source "/usr/share/bash-completion/bash_completion"
shopt -s cdspell 2> /dev/null
shopt -s checkwinsize 2> /dev/null
shopt -s dirspell 2> /dev/null
shopt -s globstar 2> /dev/null
bind 'set completion-ignore-case on'
bind 'set completion-map-case on'
bind 'set show-all-if-ambiguous on'
bind 'set mark-symlinked-directories on'
bind 'TAB:menu-complete'
export EDITOR="nvim"
export VISUAL="nvim"

#-----------------------------------------------------------------
# Paths
#-----------------------------------------------------------------
__insert_path "${HOME}/bin"
__insert_path "${HOME}/.local/bin"
__insert_path "${HOME}/bin/scripts"

#-----------------------------------------------------------------
# Aliases
#-----------------------------------------------------------------
alias c="code ."
alias clip="xclip -selection clipboard"
alias info="fastfetch"
alias ls="lsd --all --long --group-dirs first"
alias open="xdg-open ."
alias port="sudo lsof -i -P -n | grep"
alias present="mplayer tv:// -tv driver=v4l2:device=/dev/video2:noaudio:width=320:height=240 -noborder -ontop -geometry 99%:99%"
alias sudo="sudo " # Permits calling sudo alias
alias tree="lsd --tree"
alias vim="nvim"

# Alias Reminder
__line
echo " ${CYAN}Alias List${NORMAL}"
__line
alias | sort | awk -F'[ =]' '{printf "%-10s %s\n", $2, substr($0, index($0,$3))}'
__line

#-----------------------------------------------------------------
# Tokens and Keys
#-----------------------------------------------------------------

#-----------------------------------------------------------------
# Installed Package Changes
#-----------------------------------------------------------------
function __ai_bash() {
if [[ -n "$READLINE_LINE" ]]; then
    READLINE_LINE=$(aichat -e "$READLINE_LINE")
    READLINE_POINT=${#READLINE_LINE}
fi
}
bind -x '"\C-l": __ai_bash'

#-----------------------------------------------------------------
# Init Evals
#-----------------------------------------------------------------
eval "$(mcfly init bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(mise activate bash)"

#-----------------------------------------------------------------
# Appended Statements
#-----------------------------------------------------------------

