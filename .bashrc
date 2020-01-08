# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#pdf viewer
alias lspdf="evince"

#git
alias gitcd='cd $(git rev-parse --show-cdup)'
alias gitlog='echo "Commits: $(git log --pretty=oneline --abbrev-commit | wc -l)" ; git log --pretty=oneline --abbrev-commit'

#Altera Path & Enviroment:
export ALTERA_DIR="/opt/tools/intelFPGA_lite/16.1"
export MODELSIM="${ALTERA_DIR}/modelsim_ase/modelsim.ini"
export QSYS_ROOTDIR="${ALTERA_DIR}/quartus/sopc_builder/bin"
export SOPC_KIT_NIOS2="${ALTERA_DIR}/nios2eds"
export QUARTUS_ROOTDIR="${ALTERA_DIR}/quartus"
export QUARTUS_ROOT_DIR_OVERRIDE="$QUARTUS_ROOTDIR"
export MONITOR_PROGRAM="$ALTERA_DIR/University_Program/Monitor_Program/bin"
export EMBEDDED_SHELL="$ALTERA_DIR/embedded"
export DS5="$ALTERA_DIR/embedded/ds-5/bin"

export PATH="$PATH:\
$QUARTUS_ROOT_DIR_OVERRIDE/bin:\
$ALTERA_DIR/modelsim_ase/bin:\
$SOPC_KIT_NIOS2/bin:\
$QSYS_ROOTDIR:\
$MONITOR_PROGRAM:\
$EMBEDDED_SHELL"

# /etc/bashrc


# Commands:
alias l.='ls -d .* --color=auto'
alias ll='ls -la --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=always'
alias lsDU='sudo du -sh ./* | sort -n'
alias lsFS='df -TH'
alias lsLV='sudo pvs; echo ""; sudo vgs; echo ""; sudo lvs'
alias lsHD='lshal | grep -A 5 block\.device\ | grep -A 4 sd | egrep "sd|storage_device"'
alias lsHDD='lshal -t | grep storage_serial '
alias lsDISK='palimpsest'
alias wire='sudo TMP=/opt/tmp XAUTHORITY=$HOME/.Xauthority wireshark'
#alias backupscripts='rsync -a --progress /opt/scripts/* admin@backup_server:~/scripts_$(date +%Y%m%d%H%M%S)'
alias diffDirs='diff --brief --new-file --recursive '

# cd ~; xauth merge $(pwd)/.Xauthority

# add_dir="/home/aaleyan/Tutorials/socket_programming/include"
# if [ -d $add_dir ]; then
#   CPLUS_INCLUDE_PATH=$add_dir:$CPLUS_INCLUDE_PATH
#   export CPLUS_INCLUDE_PATH
#   C_INCLUDE_PATH=$add_dir:$C_INCLUDE_PATH
#   export C_INCLUDE_PATH
# fi

# screen /dev/ttysUSB0 9600 sc8
function screen_ser ()
{
        screen $1 9600 sc8 
        return
}
export -f screen_ser

function lsbond() 
{
  cat /sys/class/net/${1}/bonding/active_slave 
}
export -f lsbond


function add_user()
{
  useradd $1
  passwd $1
  gpasswd -a $1 users
  chage -E -1 -I -1 -m -1 -M -1 -W -1 $1
  chage -l $1
}
export -f add_user


function rmEverywhere()
{
  case "$(hostname)" in
  "host1") ssh host2 "rm -rf $(readlink -f $1)"
    ;;
  "host2") ssh host1 "rm -rf $(readlink -f $1)"
    ;;
  *) echo "WTF?"; exit
    ;;
  esac
  rm -rf $(readlink -f $1)
}
export -f rmEverywhere

# SSH Chain Example:
# alias TRChain='ssh -A -t -XY <user_name>@<host1> ssh -A -t -X <user_name>@<host2> ssh -A -X <user_name>@<host3>'


unset MAILCHECK
PATH=/usr/local/bin:$PATH


REDCOLOR='\[\033[1;31m\]'
YELLOWCOLOR='\[\033[1;33m\]'
PURPLECOLOR='\[\033[1;35m\]'
CYANCOLOR='\[\033[1;36m\]'
BLACKBGCOLOR='\[\e[40m\]'
HOSTCODE='\h'
USERCODE='\$'
ENDCOLOR='\[\033[0m\]'


case $USER in
	"admin")
		export PROMPT_COMMAND='PS1="${BLACKBGCOLOR}${PURPLECOLOR}[${YELLOWCOLOR}${USER}@${HOSTCODE}:\W ${PURPLECOLOR}<${CYANCOLOR}\!${PURPLECOLOR}>]${CYANCOLOR}$USERCODE$ENDCOLOR "'
		echo -en "\033]0;$USER:$PWD ${CLEARCASE_ROOT##*/}\a"
	;;
esac

:w
:0


