#!/usr/bin/bash
#-----------------------------------------------------------------
# Initialization
#-----------------------------------------------------------------
case $- in
*i*) ;;
*) return ;;
esac

RED=$'\033[31m'
BGRED=$'\033[41m'
GREEN=$'\033[32m'
MAGENTA=$'\033[35m'
CYAN=$'\033[36m'
BLUE=$'\033[34m'
YELLOW=$'\033[33m'
WHITE=$'\033[37m'
NORMAL=$'\033[00m'
BOLD=$'\033[01m'

#-----------------------------------------------------------------
# Functions
#-----------------------------------------------------------------
function __assert_bin {
  # Ensure the ~/bin directory exists
  local bin_dir="${HOME}/bin"
  if [[ ! -d "${bin_dir}" ]]; then
    mkdir -p "${bin_dir}"
  fi
}

function __z_setup {
  # Install and setup z if not exist
  # z - jump around
  # https://github.com/rupa/z
  local z_file="${HOME}/bin/z"

  if [[ ! -f "${z_file}" ]]; then
    echo "Downloading z - jump around"
    curl -so "${z_file}" "https://raw.githubusercontent.com/rupa/z/master/z.sh"
    chmod +x "${z_file}"
  fi

  # shellcheck source=/dev/null
  source "${z_file}"
}

__assert_bin
__z_setup

#-----------------------------------------------------------------
# Prompt
#-----------------------------------------------------------------

if [[ ! -f "${HOME}/.bash_git_prompt.sh" ]]; then
    curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o "${HOME}/.bash_git_prompt.sh"
    chmod +x "${HOME}/.bash_git_prompt.sh"
fi
# shellcheck disable=SC1091
source "${HOME}/.bash_git_prompt.sh"
export GIT_PS1_SHOWDIRTYSTATE=1

__get_cloud_ps1() {
    # Get current Kubernetes context and namespace
    CONTEXT=$(kubectl config current-context 2>/dev/null)
    NAMESPACE=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
    NAMESPACE="${NAMESPACE:-default}"

    CLOUDPROMPT="${BOLD}${YELLOW}("
    if [[ -n "${AWS_PROFILE}" ]]; then
        if [[ "${AWS_PROFILE}" == "PRD"* ]]; then
            CLOUDPROMPT+="${BGRED}${BOLD}${WHITE}${AWS_PROFILE}${NORMAL}${BOLD}${YELLOW} | "
        else
            CLOUDPROMPT+="aws: ${AWS_PROFILE} | "
        fi
    fi
    if [[ -n "${CONTEXT}" ]]; then
        CLOUDPROMPT+="ctx: ${CONTEXT} | ns: ${NAMESPACE}"
    fi
    CLOUDPROMPT+=")${NORMAL} "
    echo -e "${CLOUDPROMPT}"
}

__get_git_ps1() {
    GITBRANCH=$(__git_ps1 %s)
    if [[ -n "${GITBRANCH}" ]]; then
        echo -e "${CYAN}[${GITBRANCH}]${NORMAL} "
    fi
}

__set_title() {
    TITLEPREFIX=""
    if [[ -n "${AWS_PROFILE}" ]]; then
        TITLEPREFIX="${AWS_PROFILE} - "
    fi
    export TITLEPREFIX+="${PWD}"
    echo -ne "\033]0;${TITLEPREFIX}\007"
}

export PS1="\$(__set_title)${GREEN}\u@\h ${BLUE}\w \$(__get_cloud_ps1)\$(__get_git_ps1)\n\$ "

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
eval "$(mcfly init bash)"

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
# Exports and Aliases
#-----------------------------------------------------------------
# Paths
export PATH="${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/.local/bin"
# Aliases
alias clip="xclip -selection clipboard"
alias copy="rsync -ah --progress"
alias h="cat ${HOME}/.bash_eternal_history | rg -v '#\d*'"
alias history="cat ${HOME}/.bash_eternal_history"
alias ls="lsd --all --long --group-dirs first"
alias open="xdg-open ."
alias port="sudo lsof -i -P -n | grep"
alias present="mplayer tv:// -tv driver=v4l2:device=/dev/video2:noaudio:width=320:height=240 -noborder -ontop -geometry 99%:99%"
alias sudo="sudo " # Permits calling sudo alias
alias tree="lsd --tree"
alias vim="nvim"

# Alias Reminder
echo " Alias List"
echo "-------------------------------------------------------------------------------" 
alias | sort | awk -F'[ =]' '{printf "%-20s %s\n", $2, substr($0, index($0,$3))}'
echo "-------------------------------------------------------------------------------" 
#-----------------------------------------------------------------
# Tokens and Keys
#-----------------------------------------------------------------


#-----------------------------------------------------------------
# Installed Package Changes
#-----------------------------------------------------------------

# Shell-GPT integration BASH v0.2
_sgpt_bash() {
if [[ -n "$READLINE_LINE" ]]; then
    READLINE_LINE=$(sgpt --shell <<< "$READLINE_LINE" --no-interaction)
    READLINE_POINT=${#READLINE_LINE}
fi
}
bind -x '"\C-l": _sgpt_bash'
# Shell-GPT integration BASH v0.2

