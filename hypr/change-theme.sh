#!/bin/bash
POSITIONAL_ARGS=()
	case $1 in
		-c)
			case $2 in
				r)
					KittyConfig="$XDG_DATA_HOME/MCALR/thm/KittyRed.conf"
					ColorConfig="$XDG_DATA_HOME/MCALR/thm/ColorRed.css"
					RofiConfig="$XDG_DATA_HOME/MCALR/thm/RofiRed.rasi"
					MakoConfig="$XDG_DATA_HOME/MCALR/thm/MakoRed"
					HyprPaperConfig="$XDG_DATA_HOME/MCALR/thm/HyprPaperRed.conf"
					HyprLockConfig="$XDG_DATA_HOME/MCALR/thm/HyprRed.conf"
					HyprCursorConfig="$XDG_DATA_HOME/MCALR/thm/HyprCursorRed.conf"
					CursorTheme="Bibata-Original-Red"
					Wall="$XDG_DATA_HOME/MCALR/spr/WallRed.png"
					Logo="$XDG_DATA_HOME/MCALR/spr/LogoRed.png"
					RGBColor="FF0000"
					ColorName="Red"
					;;
                g)
                    KittyConfig="$XDG_DATA_HOME/MCALR/thm/KittyGreen.conf"
                    ColorConfig="$XDG_DATA_HOME/MCALR/thm/ColorGreen.css"
		   			RofiConfig="$XDG_DATA_HOME/MCALR/thm/RofiGreen.rasi"
					MakoConfig="$XDG_DATA_HOME/MCALR/thm/MakoGreen"
					HyprPaperConfig="$XDG_DATA_HOME/MCALR/thm/HyprPaperGreen.conf"
					HyprLockConfig="$XDG_DATA_HOME/MCALR/thm/HyprGreen.conf"
					HyprCursorConfig="$XDG_DATA_HOME/MCALR/thm/HyprCursorGreen.conf"
					CursorTheme="Bibata-Original-Green"
					Wall="$XDG_DATA_HOME/MCALR/spr/WallGreen.png"
					Logo="$XDG_DATA_HOME/MCALR/spr/LogoGreen.png"
					RGBColor="00FF00"
					ColorName="Green"
                    ;;
                b)
                    KittyConfig="$XDG_DATA_HOME/MCALR/thm/KittyBlue.conf"
                    ColorConfig="$XDG_DATA_HOME/MCALR/thm/ColorBlue.css"
		    		RofiConfig="$XDG_DATA_HOME/MCALR/thm/RofiBlue.rasi"
					MakoConfig="$XDG_DATA_HOME/MCALR/thm/MakoBlue"
					HyprPaperConfig="$XDG_DATA_HOME/MCALR/thm/HyprPaperBlue.conf"
					HyprLockConfig="$XDG_DATA_HOME/MCALR/thm/HyprBlue.conf"
					HyprCursorConfig="$XDG_DATA_HOME/MCALR/thm/HyprCursorBlue.conf"
					CursorTheme="Bibata-Original-Blue"
					Wall="$XDG_DATA_HOME/MCALR/spr/WallBlue.png"
					Logo="$XDG_DATA_HOME/MCALR/spr/LogoBlue.png"
					RGBColor="0000FF"
					ColorName="Blue"
                    ;;
                w)
					KittyConfig="$XDG_DATA_HOME/MCALR/thm/KittyWhite.conf"
                    ColorConfig="$XDG_DATA_HOME/MCALR/thm/ColorWhite.css"
		    		RofiConfig="$XDG_DATA_HOME/MCALR/thm/RofiWhite.rasi"
					MakoConfig="$XDG_DATA_HOME/MCALR/thm/MakoWhite"
					HyprPaperConfig="$XDG_DATA_HOME/MCALR/thm/HyprPaperWhite.conf"
					HyprLockConfig="$XDG_DATA_HOME/MCALR/thm/HyprWhite.conf"
					HyprCursorConfig="$XDG_DATA_HOME/MCALR/thm/HyprCursorWhite.conf"
					CursorTheme="Bibata-Original-White"
					Wall="$XDG_DATA_HOME/MCALR/spr/WallWhite.png"
					Logo="$XDG_DATA_HOME/MCALR/spr/LogoWhite.png"
					RGBColor="FFFFFF"
					ColorName="White"
                    ;;
				esac
				;;
		-*|--*)
			echo "Unknown option $1"
			exit 1
			;;
	esac
set -- "${POSITIONAL_ARGS[@]}"
HomeDirectory=$HOME
ln -sf $HyprPaperConfig $HomeDirectory/.config/hypr/hyprpaper.conf
ln -sf $HyprLockConfig $XDG_DATA_HOME/MCALR/thm/cur/HyprCurrent.conf
ln -sf $HyprCursorConfig $XDG_DATA_HOME/MCALR/thm/cur/HyprCursorCurrent.conf
hyprctl setcursor $CursorTheme 20 > /dev/null
hyprctl hyprpaper wallpaper ,$Wall > /dev/null
openrgb --noautoconnect --color $RGBColor & 
ln -sf $Logo $XDG_DATA_HOME/MCALR/spr/cur/LogoCurrent.png
ln -sf $KittyConfig $XDG_DATA_HOME/MCALR/thm/cur/KittyCurrent.conf
ln -sf $ColorConfig $XDG_DATA_HOME/MCALR/thm/cur/ColorCurrent.css 
ln -f $RofiConfig $XDG_DATA_HOME/MCALR/thm/cur/RofiCurrent.rasinc
ln -f $MakoConfig $XDG_DATA_HOME/MCALR/thm/cur/MakoCurrent 
killall waybar
killall mako
notify-send $ColorName
exec waybar &> /dev/null
