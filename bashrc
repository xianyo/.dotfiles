
#autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

# alias emacs
alias emacsd='nohup emacs --daemon >/dev/null 2>&1'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias es='emacs -nw'
alias wemacsd='emacs-w32 --daemon'
alias we='emacsclient-w32 -t'
alias wec='emacsclient-w32 -c'
alias wes='emacs-w32 -nw'
alias duf='du -sh' 
alias picou='picocom -b 115200 /dev/ttyUSB0' 
alias vi='e'
alias fe='a -e "emacsclient -t"' 
alias fv='a -e vim' 
alias o='a -e xdg-open'

export EDITOR='emacsclient -nw'

# run emacs daemon
[[ -z $(ps -C 'emacs --daemon' -o pid=) ]] && emacsd >&/dev/null
 
# add kill emacs function
function kill-emacs(){
     emacsclient -e "(kill-emacs)"
     emacs_pid=$( ps -C 'emacs --daemon' -o pid= )
     if [[ -n "${emacs_pid}" ]];then
        kill -9 "${emacs_pid}"
     fi
}  


#java
function setjdk(){
    if [ $1 = "jdk6" ]; then
        #echo "set jdk6"
        if [ ! -d /usr/lib/jvm/java-6-oracle ]; then
            #echo "no jdk6"
            return;
        fi
        export JAVA_HOME=/usr/lib/jvm/java-6-oracle
    elif [ $1 = "jdk7" ]; then
        #echo "set jdk7"
        if [ ! -d /usr/lib/jvm/java-7-oracle ]; then
            #echo "no jdk7"
            return;
        fi
        export JAVA_HOME=/usr/lib/jvm/java-7-oracle
    elif [ $1 = "jdk8" ]; then
        #echo "set jdk8"
        if [ ! -d /usr/lib/jvm/java-8-oracle ]; then
            #echo "no jdk8"
            return;
        fi
        export JAVA_HOME=/usr/lib/jvm/java-8-oracle
    elif [ $1 = "openjdk6" ]; then
        #echo "set openjdk6"
        if [ ! -d /usr/lib/jvm/java-6-openjdk-amd64 ]; then
            #echo "no openjdk6"
            return;
        fi
        export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64
    elif [ $1 = "openjdk7" ]; then
        #echo "set openjdk7"
        if [ ! -d /usr/lib/jvm/java-7-openjdk-amd64 ]; then
            #echo "no openjdk7"
            return;
        fi
        export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
    elif [ $1 = "openjdk8" ]; then
        #echo "set openjdk8"
        if [ ! -d /usr/lib/jvm/java-8-openjdk-amd64 ]; then
            #echo "no openjdk8"
            return;
        fi
        export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
    fi

    export JRE_HOME=${JAVA_HOME}/jre
    export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
    export PATH=${JAVA_HOME}/bin:${JRE_HOME}/bin:$PATH

}

setjdk jdk8

#android
if [ -d ${HOME}/soft/Android/sdk ]; then
    export ANDROID_SDK_HOME=${HOME}/soft/Android/sdk
    export ANDROID_HOME=${HOME}/soft/Android/sdk
    export ANDROID_NDK_HOME=${ANDROID_SDK_HOME}/ndk-bundle
    export PATH=${ANDROID_SDK_HOME}/platform-tools:${ANDROID_SDK_HOME}/tools:${ANDROID_NDK_HOME}:$PATH
fi

#emacs
if [ -d ${HOME}/soft/emacs/bin ]; then
    export PATH=${HOME}/soft/emacs/bin:$PATH
fi

#gradle
if [ -d ${HOME}/soft/gradle/bin ]; then
    export PATH=${HOME}/soft/gradle/bin:$PATH
fi

export TERM=xterm-256color                                                               
export USE_CCACHE=1 

if [ -d ${HOME}/hdd/.ccache ]; then
    export CCACHE_DIR=~/hdd/.ccache
fi

function setccache(){
	prebuilts/misc/linux-x86/ccache/ccache -M 50G
}

function setkeyswap(){
    xmodmap $HOME/.dotfiles/Xmodmap
}

function setkeyunswap(){
    xmodmap $HOME/.dotfiles/Xmodmap_or
}

function mypaxgitconfig(){
         git config --global user.name "zhuxy"
         git config --global user.email "zhuxy@paxsz.com"
}

function mygitconfig(){
          git config --global gui.encoding utf-8
          git config --global i18n.commitencoding utf-8
          git config --global svn.pathnameencoding utf-8
          git config --global http.postbuffer 524288000
          git config --global http.sslverify false
          git config --global core.quotepath false
          git config --global core.filemode false
          git config --global color.ui true
          git config --global alias.st status
          git config --global alias.ci "commit -s"
          git config --global alias.co checkout
          git config --global alias.br branch
          git config --global alias.ll "log --pretty=fuller --stat --graph --decorate"
          git config --global alias.ls "log --pretty=oneline --graph --decorate"
          git config --global alias.ss "status -sb"
          git config --global diff.tool ediff
          git config --global difftool.ediff.trustExitCode fasle
          git config --global difftool.ediff.cmd "ediff \"\$LOCAL\" \"\$REMOTE\""
          git config --global difftool.prompt false
          git config --global merge.tool ediff
          git config --global mergetool.ediff.trustExitCode false
          git config --global mergetool.ediff.cmd "emacsclient -a "" -t --eval \"(git-mergetool-emacsclient-ediff \\\"$LOCAL\\\" \\\"$REMOTE\\\" \\\"$BASE\\\" \\\"$MERGED\\\")\""
          git config --global mergetool.prompt false
          git config --global user.name "zhuxy"
          git config --global user.email "zhuxyo@163.com"
}

function settackpoint(){
	# obtain TrackPoint ID from xinput list
	TP_ID=$(xinput list | grep TrackPoint | cut -f 2 | grep -Eo '[0-9]{1,}')

	if [ -n "$TP_ID" ]; then
	    # obtain properties from xinput list-props "$TP_ID"
	    AS_ID=$(xinput list-props "$TP_ID" | grep 'Accel Constant Deceleration (' | cut -f 2 | grep -Eo '[0-9]{1,}')
	    # set the speed you want
	    xinput set-prop "$TP_ID" "$AS_ID" 0.25 
	fi
}

USE_TRACKPOINT=0

if [ $USE_TRACKPOINT = 1 ]; then
	settackpoint
fi

export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo/'


function mysoftinstall(){
    echo "android env"
    #android
    sudo apt-get install uuid uuid-dev zlib1g-dev liblz-dev liblzo2-2 liblzo2-dev lzop git git-core curl u-boot-tools mtd-utils android-tools-fsutils openssh-server openssh-client gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev lib32z-dev ccache libxml2-utils xsltproc unzip libgl1-mesa-dev --fix-missing

    echo "dev soft"
    #soft
    sudo apt-get install emacs ack-grep silversearcher-ag xsel xdg-utils picocom ctags astyle cscope cmake global python-pip python-pygments  --fix-missing
}

function ecliminstall(){
    java \
        -Dvim.files=$HOME/.vim \
        -Declipse.home=$HOME/soft/eclipse \
        -jar eclim_2.6.0.jar install
}


if [ -d ${HOME}/soft/eclipse ]; then
    export PATH=${HOME}/soft/eclipse:$PATH
fi

if [ -d ${HOME}/.dotfiles/bin ]; then
    export PATH=${HOME}/.dotfiles/bin:$PATH
fi


tmuxwork()
{
    if [ -z $1 ];then
        session=work
    else
        session=$1
    fi
    echo "session $session"
    
    tmux has -t $session
    if [ $? != 0 ];then
        echo "new $session"
        tmux new-session -s $session -d -n "bash0"     # 开启一个会话
        tmux new-window -t $session -n "bash1" "bash"       # 开启一个窗口
        tmux new-window -t $session -n "bash2" "bash"       # 开启一个窗口
        tmux selectw -t $session:0
    fi
    tmux attach -t $session
}

function mytmux(){
    if which tmux 2>&1 >/dev/null; then
        test -z "$TMUX" && (tmux attach || tmux_init $1)
    fi
}

tmuxpax()
{
    if [ -z $1 ];then
        session=work
    else
        session=$1
    fi
    echo "session $session"
    
    tmux has -t $session
    if [ $? != 0 ];then
        echo "new $session"
        tmux new-session -s $session -d -n "bash"     # 开启一个会话
        tmux new-window -t $session -n "server1" "ssh server"              # 开启一个窗口
        tmux new-window -t $session -n "server2" "ssh server"              # 开启一个窗口
        tmux new-window -t $session -n "server3" "ssh server"              # 开启一个窗口
        tmux new-window -t $session -n "server4" "ssh server"              # 开启一个窗口
        tmux new-window -t $session -n "pd" "ssh pd"       # 开启一个窗口
        tmux new-window -t $session -n "bu2" "ssh bu2"              # 开启一个窗口
        tmux new-window -t $session -n "bash1" "bash"              # 开启一个窗口
        tmux new-window -t $session -n "bash2" "bash"              # 开启一个窗口
        tmux new-window -t $session -n "bash3" "bash"              # 开启一个窗口
        tmux selectw -t $session:0
    fi
    tmux attach -t $session
}

# fasd_cache="$HOME/.fasd-init-bash"
# if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
#   fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
# fi
# source "$fasd_cache"
# unset fasd_cache
