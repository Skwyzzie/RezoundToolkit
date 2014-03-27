#!/bin/bash
version="0.1b"
dir_list=( Scripts )
error_found=0

for check_dir in ${dir_list[@]}
do
  if [ ! -e $check_dir ]
  then
    echo "Error: Folder '$check_dir' not found"
    error_found=1
  fi
done

if [ $error_found == 1 ]
then
  echo
  echo "Make sure you have all required directories in the same place."
  exit 0
fi

sOff()
{
	chmod 755 Tools/ControlBear Tools/adb Tools/fastboot
	clear
  	echo "-----------------------------------------------------------"
  	echo "  Plug your phone in now. Then press any key to continue."
  	echo "-----------------------------------------------------------"
	read 
	sudo  ./Tools/ControlBear

}

chmod 755 Scripts/*
while :
do
  clear
  echo "-----------------------------------------------------------"
  echo "    Rezound Toolbox for Linux - v$version - by xAtaxia"
  echo "-----------------------------------------------------------"
  echo 
  echo "> MAIN MENU"
  echo
  echo "  1 - Root my Rezound"
  echo "  2 - Install a Recovery"
  echo "  3 - Flash a ROM"
  echo "  4 - Nandroid Backup"
  echo "  5 - Nandroid Restore"
  echo "  6 - ADB Push/Pull"
  echo
  echo "  00 - S-OFF (Juopunutbear via Unlimited.io)"
  echo
  echo "  i - Toolbox Info/Donate"
  echo "  x - Exit"
  echo
  echo 
  echo -n "Enter option: "
  read opt

  if [ "$?" != "1" ]
  then
    case $opt in
      1) clear; bash Scripts/Root.sh; continue;;
      2) clear; bash Scripts/Recovery.sh; continue;;
      3) clear; bash Scripts/FlashROM.sh; continue;;
      4) clear; bash Scripts/NandBack.sh; continue;;
      5) clear; bash Scripts/NandRest.sh; continue;;
      6) clear; bash Scripts/ADBPP.sh; continue;;
      00) clear; sOff; continue;; 
      i) clear; bash Scripts/About.sh; continue;;
      x) exit 1;;
      *) echo "Invalid option"; continue;;
    esac
  fi
done
