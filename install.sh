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
scripts="."
sway="."
tty_clock="."
wal="."
wallpapers="."
waybar="."
wlogout="."
wofi="."
zathura="."

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
A. 	Mark All               	10.[$rofi] rofi
Z. 	Unmark All             	11.[$scripts] scripts
1. 	[$ags] ags             	12.[$sway] sway
2. 	[$btop] btop           	13.[$tty_clock] tty_clock
3. 	[$cava] cava           	14.[$wal] wal
4. 	[$dunst] dunst         	15.[$wallpapers] wallpapers
5. 	[$hypr] hypr           	16.[$waybar] waybar
6. 	[$kitty] kitty         	17.[$wlogout] wlogout
7. 	[$nvim] nvim           	18.[$wofi] wofi
8. 	[$pipes] pipes         	19.[$zathura] zathura
9. 	[$ranger] ranger

0. Quit Menu
"
}

install(){
	echo "Installing..."
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
	scripts="."
	sway="."
	tty_clock="."
	wal="."
	wallpapers="."
	waybar="."
	wlogout="."
	wofi="."
	zathura="."
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
	scripts="x"
	sway="x"
	tty_clock="x"
	wal="x"
	wallpapers="x"
	waybar="x"
	wlogout="x"
	wofi="x"
	zathura="x"
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
			if [ $scripts = "." ]; then 
				scripts="x"
			else 
				scripts="."
			fi
			;;

		"12")
			echo $userInput
			if [ $sway = "." ]; then 
				sway="x"
			else
				sway="."
			fi 
			;;

		"13")
			if [ $tty_clock = "." ]; then 
				tty_clock="x"
			else 
				tty_clock="."
			fi 
			;;

		"14")
			if [ $wal = "." ]; then 
				wal="x"
			else 
				wal="."
			fi 
			;;
		"15")

			if [ $wallpapers = "." ]; then 
				wallpapers="x"
			else 
				wallpapers="."
			fi 
			;;
		"16")
			if [ $waybar = "." ]; then 
				waybar="x"
			else 
				waybar="."
			fi 
			;;

		"17")
			if [ $wlogout = "." ]; then 
				wlogout="x"
			else 
				wlogout="."
			fi
			;;

		"18")
			if [ $wofi = "." ]; then 
				wofi="x"
			else 
				wofi="."
			fi
			;;

		"19")
			if [ $zathura = "." ]; then 
				zathura="x"
			else
				zathura="."
			fi 
			;;

		*)
			echo "Invalid input"
			;;
	esac
}

menu(){
	while [ $menu -eq 1 ]; do 
		clear
	printInstaller
		list_funcions
		read -p "Enter the number of the program you want to install: " userInput
		echo $userInput

		if [ $userInput = "0" ]; then 
			echo "Exiting"
			exit 
	 	fi 	

		switchInputOptions
	done
}

main() {

	menu
}

main

