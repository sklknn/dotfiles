#!/bin/bash 

wpDir=~/wallpapers 

function set_wallpaper(){
    cd $wpDir

    wpPath=$wpDir/$(ls -1 | shuf | head -1)

    echo ${wpPath}

    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $wpPath 
    hyprctl hyprpaper wallpaper ",${wpPath}" 
}
while true; do 
    set_wallpaper
    sleep 1800
done

