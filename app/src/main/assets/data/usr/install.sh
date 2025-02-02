#!/system/bin/sh

GRADLE_FILE="$1/framework/gradle/bin/gradle"
DOWNLOAD_URL="https://gh-proxy.com/https://github.com/kuyebao/kuyebao/releases/download/AIDE-PRO/gradle_7.5.1.tar.xz"
TEMP_FILE="$1/gradle.tar.xz"
FRAMEWORK_DIR="$1/framework/"

clear
if [ ! -f $GRADLE_FILE ]; then
    echo -e "\033[32m准备下载Gradle... / Ready to download Gradle...\033[0m"
    rm -f $TEMP_FILE 2>/dev/null
    wget $DOWNLOAD_URL -O $TEMP_FILE
    
    if [ $? -eq 0 ]; then
            echo -e "\033[32m安装Gradle中（时间比较长，请耐心等待）/ Installing Gradle (it takes a long time, please wait patiently)\033[0m"
            tar xJf $TEMP_FILE -C $1
            if [ $? -eq 0 ]; then
                rm -f $TEMP_FILE 2>/dev/null
                chmod -R 777 $FRAMEWORK_DIR
                echo -e "\033[32m你的Gradle已安装！/ Your Gradle is installed!\033[0m"
            else
                rm -f $TEMP_FILE 2>/dev/null
                echo -e "\033[31m解压失败 / Decompression failed\033[0m"
                exit 1
            fi
       
    else
        rm -f $TEMP_FILE 2>/dev/null
        echo -e "\033[31m下载失败 / Download failed\033[0m"
        exit 1
    fi
    
else
    echo -e "\033[32m你的Gradle已安装！/ Your Gradle is installed!\033[0m"
fi