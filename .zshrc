##### INSTALLED BY github.com/dt665m/dotfiles #####

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin:/usr/local/bin
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
export LANG=en_US.UTF-8

# import plugins
source ~/.zsh_plugins.sh
source ~/.cargo/env

# aliases
alias kk=ll
alias dicker=docker
alias git=hub
alias gut=git
alias checkout=co
alias e04=fuck

#extend basic command
function mygrep() {
	grep $1 * -rIn --color $2 $3 $4 $5 $6 $7 $8 $9
}

#CPU temper
function CPUT() {
	sudo powermetrics --samplers smc |grep -i "CPU die temperature"
}

#Save a diff file before run checkout .
function gco_clean() {
	branch_name=$(git branch --show-current | sed 's/\//_/g')
	diff_file="diff_${branch_name}"
	git diff > ${diff_file}; git checkout .
	echo "save changes into: " $diff_file
}

#delete local branch if remote branch is deleted
function git_prune_local_branch() {
	git fetch -p; git branch -vv | git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -t git branch -D
}

#Check network
function my_network_test() {
	ping 8.8.8.8
}

#Stop mouse acceleration
function stop_mouse_accele() {
	defaults write .GlobalPreferences com.apple.mouse.scaling -1
}

#print my custom commands
function show_my_custom_zsh() {
	head -n 50 ~/.zshrc
}

# handle theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir go_version vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator history background_jobs ram load time)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

# Visual customisation of the second prompt line
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰\uF460\uF460\uF460 "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{249}%}\u2517\uf054%{%F{default}%} "

# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} "$"%{%b%f%k%F{yellow}%} %{%f%}"
POWERLEVEL9K_MODE='nerdfont-complete'
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

# zsh configuration
SAVEHIST=50
HISTFILE=~/.zsh_history

POWERLEVEL9K_COLOR_SCHEME='light'

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon virtualenv context dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)

POWERLEVEL9K_VIRTUALENV_BACKGROUND='springgreen4'

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='springgreen3'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='black'

POWERLEVEL9K_DIR_HOME_BACKGROUND='springgreen2'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='springgreen2'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'

POWERLEVEL9K_OS_ICON_BACKGROUND='grey0'
POWERLEVEL9K_OS_ICON_FOREGROUND='deepskyblue3'

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='grey11'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='grey11'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='grey11'

POWERLEVEL9K_STATUS_OK_BACKGROUND='springgreen2'
POWERLEVEL9K_STATUS_OK_FOREGROUND='black'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='red'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='black'

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ice/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ice/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ice/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ice/google-cloud-sdk/completion.zsh.inc'; fi

eval $(thefuck --alias)
