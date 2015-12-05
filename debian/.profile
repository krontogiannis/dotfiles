export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

export EDITOR="vim"
# HOLY CRAP
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

alias e=$EDITOR
alias m='make -j 8'
alias c=clear
alias ls='ls --color=auto'
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

GIT_PS1_SHOWDIRTYSTATE="yes"
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWCOLORHINTS="yes"
GIT_PS1_SHOWSTASHSTATE="yes"
GIT_PS1_SHOWUNTRACKEDFILES="yes"
GIT_PS1_SHOWUPSTREAM="auto, verbose"

#PROMPT_COMMAND='__git_ps1 "\[$Green\]\u@\h: \[$Blue\]\w\[$Color_Reset\]" " \[$Green\]\$ \[$Color_Reset\]"'

fancy_prompt() {
    if [ "$(id -u)" != "0" ] ; then
        local SIMPLE="\[$Orange\]> \[$Color_Reset\]"
    else
        local SIMPLE="\[$BIRed\]# \[$Color_Reset\]"
    fi;
    local NEWDIR=`pwd`

    if history | tail -n 1 | grep -qE ' (clear|c)$' || [ "$NEWDIR" != "$CURRDIR" ]; then
        echo -ne "\033]0;Terminal - ${PWD}\007"
        local ITEMS=`ls -1 . | wc -l | xargs`
        local UPTIME=`uptime | tr "," " " | cut -f4-5 -d" " | xargs`
        local PSCOUNT=`ps -A | wc -l | xargs`
        __git_ps1 "\[$Orange\]\u\[$Color_Reset\] at \[$Orange\]\H\[$Color_Reset\] : \[$BICyan\]\$PWD \[$ICyan\]total $ITEMS\[$IWhite\] uptime $UPTIME, $PSCOUNT processes\[$Color_Reset\]" "\n$SIMPLE"
    else
        export PS1=$SIMPLE;
    fi;
    CURRDIR=$NEWDIR
}
PROMPT_COMMAND="fancy_prompt"
