#!/bin/bash
Cont()
{
 clear
  echo "-----------------------------------------------------------"
  echo "       Root my Rezound - xAtaxia's Rezound Toolbox"
  echo "-----------------------------------------------------------"
  echo
  echo "> What do you want to do?"
  echo
  echo "  1 - Permanent flash recovery (No OTA (Shouldn't matter anymore))"
  echo "  2 - Temporary flash recovery (Can recieve OTA Updates)"
  echo "  3 - I already have a custom recovery, Flash Superuser"
  echo
  echo "  x - Cancel"; read opt2
  if [ "$?" != "1" ]
  then
    case $opt2 in
      1) clear; Cont;;
      2) clear; Cont;;
      3) clear; bash Bootloader.sh; continue;;
      4) clear; bash Bootloader.sh; continue;;
      5) exit 1;;
      X) exit 1;;
      *) echo "Invalid option"; ;;
    esac
  fi	
}

while :
do
  clear
  echo "-----------------------------------------------------------"
  echo "       Root my Rezound - xAtaxia's Rezound Toolbox"
  echo "-----------------------------------------------------------"
  echo 
  echo "x - back to main menu"
  echo
  echo "> Is your bootloader already unlocked? [y/n]: "; read opt
  if [ "$?" != "1" ]
  then
    case $opt in
      y) clear; Cont;;
      Y) clear; Cont;;
      n) clear; bash Bootloader.sh; continue;;
      N) clear; bash Bootloader.sh; continue;;
      x) exit 1;;
      X) exit 1;;
      *) echo "Invalid option"; continue;;
    esac
  fi
done
