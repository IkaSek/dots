# startup commands
##############################################
echo $(uname -s) on $(uname -r)| lolcat
fastfetch
##############################################

force_color_prompt=yes
IKA_LOCAL="$HOME/.ilocal/"
__IKA_NO_BLESH=0 # <-- DISABLE BLESH HERE!!! (set this variable to something else than 0)
# check if blesh should be enabled
#############################################
if [ ${__IKA_NO_BLESH} -eq 0 ]; then
    . ${IKA_LOCAL}/bin/ble.sh --noattach
fi
#############################################

export EDITOR="nvim"
PS1='[\e[1m\e[38;5;56m\u\e[0m@\e[1m\e[38;5;92m\H\e[0m] [\e[1m\e[38;5;99m\W\e[0m] \\$ '
GPG_TTY=$(tty)

alias dot="git --git-dir=/media/hdd1/src/dot --work-tree=$HOME"
alias ls="exa --icons"
alias tldr="bun tldr"
alias e="$EDITOR"

if [ ${__IKA_NO_BLESH} -eq 0 ]; then
    ble-attach
fi
