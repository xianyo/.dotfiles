
#autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

# alias emacs
alias emacsd='emacs --daemon'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias es='emacs -nw'
alias wemacsd='emacs-w32 --daemon'
alias we='emacsclient-w32 -t'
alias wec='emacsclient-w32 -c'
alias wes='emacs-w32 -nw'
alias duf='du -sh' 
alias picou='picocom -b 115200 /dev/ttyUSB0' 
alias vi='vim'


# run emacs daemon
#[[ -z $(ps -C 'emacs --daemon' -o pid=) ]] && emacsd >&/dev/null
 
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
    export NDK_HOME=${ANDROID_SDK_HOME}/ndk-bundle
    export PATH=${ANDROID_SDK_HOME}/platform-tools:${ANDROID_SDK_HOME}/tools:${NDK_HOME}:$PATH
fi

#emacs
if [ -d ${HOME}/soft/emacs/bin ]; then
    export PATH=${HOME}/soft/emacs/bin:$PATH
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
    sudo apt-get install emacs vim-gnome ack-grep silversearcher-ag zsh picocom ctags astyle cscope cmake global python-pygments  --fix-missing
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

