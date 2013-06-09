#!/bin/bash
UnlockPATH="none"
flashUnlock()
{
	clear
	echo "-----------------------------------------------------------"
	echo "              Unlocking your bootloader..."
	echo "-----------------------------------------------------------"
	echo
	cd Tools
	fastboot flash unlocktoken $UnlockPATH	
}
noUnlockCode()
{
	clear
	echo "-----------------------------------------------------------"
	echo "   Redirecting you to HTCDev to rerieve your unlock code"
	echo "-----------------------------------------------------------"
	echo
	if which xdg-open > /dev/null
	then
		xdg-open "http://www.htcdev.com/bootloader/"
	elif which gnome-open > /dev/null
	then
		gnome-open "http://www.htcdev.com/bootloader/"
	fi
	sleep 5s
	echo "Once you get your key, place it in the UNLOCK_CODE_HERE folder"
	read -n1 -r -p "Press any key to return to Bootloader menu..."
}

specLoc()
{
	clear
	echo "-----------------------------------------------------------"
	echo "    Please enter the full directory of Unlock_code.bin"
	echo "-----------------------------------------------------------"
	echo
	read UnlockPATH
}
unlockCode()
{
	if [ -a ../UNLOCK_CODE_HERE/Unlock_code.bin ]
	then
		clear
		echo "-----------------------------------------------------------"
		echo "     Found your Unlock Code. Please plug in your phone"
		echo "-----------------------------------------------------------"
		echo
		UnlockPATH="../UNLOCK_CODE_HERE/Unlock_code.bin"
		flashUnlock
		read -n1 -r -p "Press any key to return to Root menu..."

	else
		clear
		echo "-----------------------------------------------------------"
		echo "               ERROR: No unlock code found"
		echo "-----------------------------------------------------------"
		echo "Would you like to specify the location of Unlock_code.bin? [y/n]: "; read opt2
		echo
		 if [ "$?" != "1" ]
  then
    case $opt2 in
      y) clear; specLoc;;
      Y) clear; specLoc;;
      n) clear; continue;;
      N) clear; continue;;
      *) echo "Invalid option"; continue;;
    esac
  fi
		read -n1 -r -p "Press any key to return to Root menu..."
	fi
}

while :
do
  clear
  echo "-----------------------------------------------------------"
  echo "       Unlock bootloader - xAtaxia's Rezound Toolbox"
  echo "-----------------------------------------------------------"
  echo 
  echo "x - back to main menu"
  echo
  echo "> Do you already have your unlock code? [y/n]: "; read opt

  if [ "$?" != "1" ]
  then
    case $opt in
      y) clear; unlockCode;;
      Y) clear; unlockCode;;
      n) clear; noUnlockCode;;
      N) clear; noUnlockCode;;
      x) exit 1;;
      X) exit 1;;
      *) echo "Invalid option"; continue;;
    esac
  fi
done
