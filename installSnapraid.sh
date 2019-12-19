#!/bin/bash
main(){
    install(){
        if(whiptail --title "Yes/No" --yesno "Continue?
确认安装？" 10 60)then
            apt update
            apt install gcc make -y
            mkdir /var/lib/snapraid
            chmod a+w /var/lib/snapraid
            cd /var/lib/snapraid
            wget https://github.com/amadvance/snapraid/releases/download/v11.3/snapraid-11.3.tar.gz
            tar xzf snapraid-11.3.tar.gz 
            cd snapraid-11.3/
            ./configure --prefix=/usr/local/
            make
            make check
            make install
        else
            main
        fi
    }
    uninstall(){
        if(whiptail --title "Yes/No" --yesno "Continue?
确认卸载？" 10 60)then
            rm -rf /usr/local/snapraid
        else
            main
        fi
    }
    if [ $L = "en" ];then
        x=$(whiptail --title " Snapraid installer v1.0 " --menu "Please choose:" 25 60 15 \
        "a" "Install." \
        "b" "Uninstall" \
        3>&1 1>&2 2>&3)
    else
        x=$(whiptail --title " Snapraid installer v1.0 " --menu "Please choose:" 25 60 15 \
        "a" "安装." \
        "b" "卸载" \
        3>&1 1>&2 2>&3)
    fi
    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        case "$x" in
        a )
            install
            ;;
        b )
            uninstall
        esac
    fi



}

if (whiptail --title "Language" --yes-button "中文" --no-button "English"  --yesno "Choose Language:
选择语言：" 10 60) then
    L="zh"
else
    L="en"
fi
main
