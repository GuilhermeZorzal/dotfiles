#                  _       _     _           
# __   ____ _ _ __(_) __ _| |__ | | ___  ___ 
# \ \ / / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#  \ V / (_| | |  | | (_| | |_) | |  __/\__ \
#   \_/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
#                                            
ags="."
btop="."
cava="."
dunst="."
hypr="."
kitty="."
nvim="."
pipes="."
ranger="."
rofi="."
sway="."
tty_clock="."
wal="."
waybar="."
wlogout="."
wofi="."
zathura="."
zshrc="."
alacritty="."

menu=1
userInput=0

#   __                  _   _                 
#  / _|_   _ _ __   ___| |_(_) ___  _ __  ___ 
# | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
# |  _| |_| | | | | (__| |_| | (_) | | | \__ \
# |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
#                                             

printInstaller() {
	echo "\
	======================================
	 _           _        _ _           
	(_)_ __  ___| |_ __ _| | | ___ _ __ 
	| | '_ \/ __| __/ _\` | | |/ _ \ '__|
	| | | | \__ \ || (_| | | |  __/ |   
	|_|_| |_|___/\__\__,_|_|_|\___|_|   
	======================================
	"
}

list_funcions(){
echo "
A. Mark All               	
Z. Unmark All             	
1. [$ags] ags             	
2. [$btop] btop           	
3. [$cava] cava           	
4. [$dunst] dunst         	
5. [$hypr] hypr           	
6. [$kitty] kitty         	
7. [$nvim] nvim           	
8. [$pipes] pipes         	
9. [$ranger] ranger       	
10. [$rofi] rofi
11. [$sway] sway
12. [$tty_clock] tty_clock
13. [$wal] wal
14. [$waybar] waybar
15. [$wlogout] wlogout
16. [$wofi] wofi
17. [$zathura] zathura
18. [$zshrc] zshrc
19. [$alacritty] alacritty

0. Quit Menu
"
}
preInstall(){
	printInstaller
	echo "Welcome to the installer of my dotfiles!!!

Before continuing, note that this installer wont install 
anything in your system. What we're going to do is to set
the config files of certain aplications. To install it you
must dowload the packages for yourself.

At the end, after you choose your desired packages, we'll 
give you all the packages names you installed, so you can 
install it latter by yourself.

IMPORTANT: Make sure you are executing this script inside
the dotfiles folder. If you are not, please exit and move
to the correct path.

"
	while [ true ]; do
		read -p "Do you want to procced? [Y/n]: " userInput
		if [ $userInput = "n" ]; then 
			echo "Exiting..."
			exit
		elif [ $userInput = "Y" ]; then 
			break
		elif [ $userInput = "y" ]; then 
			break
		else 
			echo "Invalid input!!"
		fi
	done	
		

}

replacePathHome(){
	local path=$1
	rm -rf ~/$path
	echo "REMOVED PATH TO $path"
	ln -s $(pwd)/$path ~/$path
	echo "$path configuration set :)"
}

replacePath(){
	local path=$1
	rm -rf ~/.config/$path
	echo "REMOVED PATH TO $path"
	ln -s $(pwd)/$path ~/.config/$path
	echo "$path configuration set :)"
}

verifyPath(){
	local path=$1
	if ! [ -e "$path" ]; then 
		echo "
		????????????????????????

                          
		  ___ _ __ _ __ ___  _ __ 
		 / _ \ '__| '__/ _ \| '__|
		|  __/ |  | | | (_) | |   
		 \___|_|  |_|  \___/|_|   
								  
		INTERNAL ERROR ON THE INSTALLER
		????????????????????????

		error trying to install $path. Please check if the path is correct and try again.
		"
		

		exit
	fi
	echo ""
	echo "===================="
	echo "Installing $path"
	echo "===================="

	if [ $path = ".zshrc" ]; then 
		if [ -e "$HOME/.zshrc" ]; then 
			while [ true ]; do
				read -p "Config for $path already exists. Do you want to replace the existing configuration? [Y/n]: " userInput
				if [ $userInput = "Y" ]; then 
					replacePathHome $path
					break
				elif [ $userInput = "y" ]; then 
					replacePathHome $path
					break
				elif [ $userInput = "n" ]; then 
					echo "Skipping..."
					break
				else 
					echo "Invalid input!!"
				fi
			done
		else 
			echo -e "$HOME/.zshrc" 
			ln -s $(pwd)/$1 ~/.zshrc
			echo "$1 configuration set :)"
		fi
		echo "------------------"
		echo ""
		return
	fi

	if [ -e "$HOME/.config/$path" ]; then 
		while [ true ]; do
			read -p "Config for $path already exists. Do you want to replace the existing configuration? [Y/n]: " userInput
			if [ $userInput = "Y" ]; then 
				replacePath $path
				break
			elif [ $userInput = "y" ]; then 
				replacePath $path
				break
			elif [ $userInput = "n" ]; then 
				echo "Skipping..."
				break
			else 
				echo "Invalid input!!"
			fi
		done

	else 
		echo -e "$HOME/.config/$path" 
		ln -s $(pwd)/$1 ~/.config/$1
		echo "$1 configuration set :)"
	fi
	echo "------------------"
	echo ""
}


installPackages(){
	if [ $ags = "x" ]; then 
		verifyPath "ags"
	fi
	if [ $btop = "x" ]; then 
		verifyPath "btop"
	fi
	if [ $cava = "x" ]; then 
		verifyPath "cava"
	fi
	if [ $dunst = "x" ]; then 
		verifyPath "dunst"
	fi
	if [ $hypr = "x" ]; then 
		verifyPath "hypr"
		echo "hypr"
	fi
	if [ $kitty = "x" ]; then 
		verifyPath "kitty"
		echo "kitty"
	fi
	if [ $nvim = "x" ]; then 
		verifyPath "nvim"
		echo "nvim"
	fi
	if [ $pipes = "x" ]; then 
		verifyPath "pipes"
		echo "pipes"
	fi
	if [ $ranger = "x" ]; then 
		verifyPath "ranger"
		echo "ranger"
	fi
	if [ $rofi = "x" ]; then 
		verifyPath "rofi"
		echo "rofi"
	fi
	if [ $sway = "x" ]; then 
		verifyPath "sway"
		echo "sway"
	fi
	if [ $tty_clock = "x" ]; then 
		verifyPath "tty-clock"
		echo "tty_clock"
	fi
	if [ $wal = "x" ]; then 
		verifyPath "wal"
		echo "wal"
	fi
	if [ $waybar = "x" ]; then 
		verifyPath "waybar"
		echo "waybar"
	fi
	if [ $wlogout = "x" ]; then 
		verifyPath "wlogout"
		echo "wlogout"
	fi
	if [ $wofi = "x" ]; then 
		verifyPath "wofi"
		echo "wofi"
	fi
	if [ $zathura = "x" ]; then 
		verifyPath "zathura"
		echo "zathura"
	fi
	if [ $zshrc = "x" ]; then 
		verifyPath ".zshrc"
		echo "zshrc"
	fi
	if [ $alacritty = "x" ]; then 
		verifyPath "alacritty"
		echo "alacritty"
	fi
}

verifyPackages(){
	if [ $ags = "x" ]; then 
		echo "ags"
	fi
	if [ $btop = "x" ]; then 
		echo "btop"
	fi
	if [ $cava = "x" ]; then 
		echo "cava"
	fi
	if [ $dunst = "x" ]; then 
		echo "dunst"
	fi
	if [ $hypr = "x" ]; then 
		echo "hypr"
	fi
	if [ $kitty = "x" ]; then 
		echo "kitty"
	fi
	if [ $nvim = "x" ]; then 
		echo "nvim"
	fi
	if [ $pipes = "x" ]; then 
		echo "pipes"
	fi
	if [ $ranger = "x" ]; then 
		echo "ranger"
	fi
	if [ $rofi = "x" ]; then 
		echo "rofi"
	fi
	if [ $sway = "x" ]; then 
		echo "sway"
	fi
	if [ $tty_clock = "x" ]; then 
		echo "tty_clock"
	fi
	if [ $wal = "x" ]; then 
		echo "wal"
	fi
	if [ $waybar = "x" ]; then 
		echo "waybar"
	fi
	if [ $wlogout = "x" ]; then 
		echo "wlogout"
	fi
	if [ $wofi = "x" ]; then 
		echo "wofi"
	fi
	if [ $zathura = "x" ]; then 
		echo "zathura"
	fi
	if [ $zshrc = "x" ]; then 
		echo "zshrc"
	fi
	if [ $alacritty = "x" ]; then 
		echo "alacritty"
	fi
}

unmarkAll() {
	ags="."
	btop="."
	cava="."
	dunst="."
	hypr="."
	kitty="."
	nvim="."
	pipes="."
	ranger="."
	rofi="."
	sway="."
	tty_clock="."
	wal="."
	waybar="."
	wlogout="."
	wofi="."
	zathura="."
	zshrc="."
	alacritty="."
}

markAll() {
	ags="x"
	btop="x"
	cava="x"
	dunst="x"
	hypr="x"
	kitty="x"
	nvim="x"
	pipes="x"
	ranger="x"
	rofi="x"
	sway="x"
	tty_clock="x"
	wal="x"
	waybar="x"
	wlogout="x"
	wofi="x"
	zathura="x"
	zshrc="x"
	alacritty="x"
}

switchInputOptions(){
	case $userInput in
		"a")
			markAll
			;;
		"z")
			unmarkAll
			;;
		"A") 
			markAll
			;;
		"Z") 
			unmarkAll
			;;
		"1") 
			if [ $ags = "." ]; then 
				ags="x"
			else
				ags="."
			fi
			;;

		"2")
			if [ $btop = "." ]; then 
				btop="x"
			else
				ags="."
			fi
			;;
		"3") 
			if [ $cava = "." ]; then 
				cava="x"
			else 
				cava="."
			fi
			;;

		"4") 
			if [ $dunst = "." ]; then 
				dunst="x"
			else 
				dunst="."
			fi 
			;;

		"5") 
			if [ $hypr = "." ]; then 
				hypr="x"
			else
				hypr="."
			fi 
			;;

		"6") 
			if [ $kitty = "." ]; then 
				kitty="x"
			else 
				kitty="."
			fi 
			;;

		"7") 
			if [ $nvim = "." ]; then 
				nvim="x"
			else 
				nvim="."
			fi 
			;;
		"8") 

			if [ $pipes = "." ]; then 
				pipes="x"
			else 
				pipes="."
			fi 
			;;
		"9") 
			if [ $ranger = "." ]; then 
				ranger="x"
			else 
				ranger="."
			fi
			;;

		"10") 
			if [ $rofi = "." ]; then 
				rofi="x"
			else 
				rofi="."
			fi
			;;
		"11")
			if [ $sway = "." ]; then 
				sway="x"
			else
				sway="."
			fi 
			;;

		"12")
			if [ $tty_clock = "." ]; then 
				tty_clock="x"
			else 
				tty_clock="."
			fi 
			;;

		"13")
			if [ $wal = "." ]; then 
				wal="x"
			else 
				wal="."
			fi 
			;;
		"14")
			if [ $waybar = "." ]; then 
				waybar="x"
			else 
				waybar="."
			fi 
			;;

		"15")
			if [ $wlogout = "." ]; then 
				wlogout="x"
			else 
				wlogout="."
			fi
			;;

		"16")
			if [ $wofi = "." ]; then 
				wofi="x"
			else 
				wofi="."
			fi
			;;

		"17")
			if [ $zathura = "." ]; then 
				zathura="x"
			else
				zathura="."
			fi 
			;;

		"18")
			if [ $zshrc = "." ]; then 
				zshrc="x"
			else
				zshrc="."
			fi 
			;;
		"19")
			if [ $alacritty = "." ]; then 
				alacritty="x"
			else
				alacritty="."
			fi 
			;;
		*)
			echo "Invalid input"
			read
			;;
	esac
}

menu(){
	while [ $menu -eq 1 ]; do 
		clear
		printInstaller
		list_funcions
		read -p "Enter the option you want to choose: " userInput
		echo $userInput

		if [ $userInput = "0" ]; then 
			echo "Exiting"
			break 
	 	fi 	

		switchInputOptions
	done
}

install() {
	clear
	echo "Installing the following packages: "
	verifyPackages
	echo ""
	installPackages
	echo ""
	echo "Exiting..."
	exit
}

main() {
	clear
	preInstall
	menu
	while true; do
		clear
		echo "Selected Packages: "
		verifyPackages
		echo ""
		read -p "Do you want to install the selected packages?
	1. Yes
	2. No
	3. Return to menu

	What you want to do? " userInput

		if [ $userInput = "1" ]; then 
			install
		elif [ $userInput = "2" ]; then 
			exit
		elif [ $userInput = "3" ]; then 
			menu
		else 
			echo "Invalid input!!"
			read 
		fi
	done 
}

main

