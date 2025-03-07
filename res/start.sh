ROOT_PATH=$(cd "$(dirname "$0")"; pwd)

start_wx(){
    #wine 'C:\Program Files (x86)\Tencent\WeChat\WeChat.exe' &
    env WINEPREFIX="/root/.wine" wine /root/.wine/drive_c/Program\\ Files/Tencent/WeChat/WeChat.exe &
    sleep 10 
    xdotool mousemove --screen 0 645 447 && xdotool click 1 &
}

pushd $ROOT_PATH
while true; do

# 检测 WeChat.exe 进程是否存在
if ! pgrep -x "WeChat.exe" > /dev/null; then
    echo "WeChat.exe 进程未运行，日志记录..."
    start_wx &
fi

# 检测 python.exe 进程是否存在
if ! pgrep -x "injector.exe" > /dev/null; then
    echo "injector.exe 进程未运行，日志记录..."
    bash /root/res/launch.sh &
fi

sleep 10

done
popd
