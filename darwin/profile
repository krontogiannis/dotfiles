# MacPorts Installer addition on 2014-12-22_at_20:28:57: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export EDITOR="vim"
#export SDKROOT="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk"
# HOLY CRAP
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

alias e='atom'
alias m='make -j 8'
alias c=clear
alias la='ls -la'
alias l='ls -l'
alias s=''

# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source ~/.bash/dnvm.sh
source ~/.bash/git-prompt.sh
source ~/.bash/colors.sh
source ~/.bash/git-completion.sh
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi
#source ~/.bash/azure.completion.sh
if [ "$(id -u)" != "0" ] ; then
    source ~/.livestreamer.sh
fi;

code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}

update_all () {
    brew update && brew upgrade
    sudo port selfupdate && sudo port upgrade outdated
}

GIT_PS1_SHOWDIRTYSTATE="yes"
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWCOLORHINTS="yes"
GIT_PS1_SHOWSTASHSTATE="yes"
GIT_PS1_SHOWUNTRACKEDFILES="yes"
GIT_PS1_SHOWUPSTREAM="auto, verbose"

#PROMPT_COMMAND='__git_ps1 "\[$Green\]\u@\h: \[$Blue\]\w\[$Color_Reset\]" " \[$Green\]\$ \[$Color_Reset\]"'

fancy_prompt() {
    if [ "$(id -u)" != "0" ] ; then
        local SIMPLE="\[$BIGreen\]> \[$Color_Reset\]"
    else
        local SIMPLE="\[$BIRed\]# \[$Color_Reset\]"
    fi;
    local NEWDIR=`pwd`

    if history | tail -n 1 | grep -qE ' (clear|c)$' || [ "$NEWDIR" != "$CURRDIR" ]; then
        echo -ne "\033]0;Terminal - ${PWD}\007"
        local ITEMS=`ls -1 . | wc -l | xargs`
        local UPTIME=`uptime | tr "," " " | cut -f4-5 -d" " | xargs`
        local PSCOUNT=`ps -A | wc -l | xargs`
        __git_ps1 "\[$IRed\]\u\[$Color_Reset\] at \[$IRed\]\H\[$Color_Reset\] : \[$BICyan\]\$PWD \[$ICyan\]total $ITEMS\[$IWhite\] uptime $UPTIME, $PSCOUNT processes\[$Color_Reset\]" "\n$SIMPLE"
    else
        export PS1=$SIMPLE;
    fi;
    CURRDIR=$NEWDIR
}
PROMPT_COMMAND="fancy_prompt"

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
