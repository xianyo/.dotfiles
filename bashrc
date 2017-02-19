
#autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

# alias emacs
alias emacsd='emacs --daemon'
alias e='emacsclient -t'
alias ec='emacsclient -c'
 
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
    if [ $1 == "jdk6" ]; then
        #echo "set jdk6"
        if [ ! -d /usr/lib/jvm/java-6-oracle ]; then
            #echo "no jdk6"
            exit;
        fi
        export JAVA_HOME=/usr/lib/jvm/java-6-oracle
    elif [ $1 == "jdk7" ]; then
        #echo "set jdk7"
        if [ ! -d /usr/lib/jvm/java-7-oracle ]; then
            #echo "no jdk7"
            exit;
        fi
        export JAVA_HOME=/usr/lib/jvm/java-7-oracle
    elif [ $1 == "jdk8" ]; then
        #echo "set jdk8"
        if [ ! -d /usr/lib/jvm/java-8-oracle ]; then
            #echo "no jdk8"
            exit;
        fi
        export JAVA_HOME=/usr/lib/jvm/java-8-oracle
    elif [ $1 == "openjdk6" ]; then
        #echo "set openjdk6"
        if [ ! -d /usr/lib/jvm/java-6-openjdk-amd64 ]; then
            #echo "no openjdk6"
            exit;
        fi
        export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64
    elif [ $1 == "openjdk7" ]; then
        #echo "set openjdk7"
        if [ ! -d /usr/lib/jvm/java-7-openjdk-amd64 ]; then
            #echo "no openjdk7"
            exit;
        fi
        export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
    elif [ $1 == "openjdk8" ]; then
        #echo "set openjdk8"
        if [ ! -d /usr/lib/jvm/java-8-openjdk-amd64 ]; then
            #echo "no openjdk8"
            exit;
        fi
        export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
    fi

    export JRE_HOME=${JAVA_HOME}/jre
    export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
    export PATH=${JAVA_HOME}/bin:${JRE_HOME}/bin:$PATH

}

setjdk jdk8

#android
if [ -d /home/zhuxy/soft/Android/sdk ]; then
    export ANDROID_SDK_HOME=/home/zhuxy/soft/Android/sdk
    export NDK_HOME=${ANDROID_SDK_HOME}/ndk-bundle
    export PATH=${ANDROID_SDK_HOME}/platform-tools:${ANDROID_SDK_HOME}/tools:${NDK_HOME}:$PATH
fi

export TERM=xterm-256color                                                               
export USE_CCACHE=1 


# obtain TrackPoint ID from xinput list
TP_ID=$(xinput list | grep TrackPoint | cut -f 2 | grep -Eo '[0-9]{1,}')

if [ -n "$TP_ID" ]; then
    # obtain properties from xinput list-props "$TP_ID"
    AS_ID=$(xinput list-props "$TP_ID" | grep 'Accel Constant Deceleration (' | cut -f 2 | grep -Eo '[0-9]{1,}')
    # set the speed you want
    xinput set-prop "$TP_ID" "$AS_ID" 0.20 
fi
