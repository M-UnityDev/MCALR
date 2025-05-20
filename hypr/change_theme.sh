#!/bin/bash

POSITIONAL_ARGS=()
	case $1 in
		-c|--color)
			case $2 in
				r|red)
					KittyConfig="/ast/thm/KittyRed.conf"
					ColorConfig="/ast/thm/ColorRed.css"
					HyprPaperConfig="/ast/thm/HyprPaperRed.conf"
					HyprLockConfig="/ast/thm/HyprRed.conf"
					Wall="/ast/spr/WallRed.png"
					Logo="/ast/spr/LogoRed.png"
					;;
                g|green)
                    KittyConfig="/ast/thm/KittyGreen.conf"
                    ColorConfig="/ast/thm/ColorGreen.css"
					HyprPaperConfig="/ast/thm/HyprPaperGreen.conf"
					HyprLockConfig="/ast/thm/HyprGreen.conf"
					Wall="/ast/spr/WallGreen.png"
					Logo="/ast/spr/LogoGreen.png"
                    ;;
                b|blue)
                    KittyConfig="/ast/thm/KittyBlue.conf"
                    ColorConfig="/ast/thm/ColorBlue.css"
					HyprPaperConfig="/ast/thm/HyprPaperBlue.conf"
					HyprLockConfig="/ast/thm/HyprBlue.conf"
					Wall="/ast/spr/WallBlue.png"
					Logo="/ast/spr/LogoBlue.png"
                    ;;
                w|black)
					KittyConfig="/ast/thm/KittyBlack.conf"
                    ColorConfig="/ast/thm/ColorBlack.css"
					HyprPaperConfig="/ast/thm/HyprPaperBlack.conf"
					HyprLockConfig="/ast/thm/HyprBlack.conf"
					Wall="/ast/spr/WallBlack.png"
					Logo="/ast/spr/LogoBlack.png"
                    ;;
			esac
				;;
		-*|--*)
			echo "Unknown option $1"
			exit 1
			;;
	esac
set -- "${POSITIONAL_ARGS[@]}"
HomeDirectory="/home/m-unity/"
hyprctl hyprpaper preload $Wall > /dev/null
hyprctl hyprpaper wallpaper ,$Wall > /dev/null
ln -sf $Logo /ast/spr/cur/LogoCurrent.png
cp -f $KittyConfig /ast/thm/cur/KittyCurrent.conf
cp -f $ColorConfig /ast/thm/cur/ColorCurrent.css
cp -f $HyprPaperConfig $HomeDirectory.config/hypr/hyprpaper.conf
cp -f $HyprLockConfig /ast/thm/cur/HyprCurrent.conf
hyprshade on shake
killall waybar
kitty @ load-config
exec waybar &> /dev/null &
sleep .1
hyprshade off
