#!/bin/sh 

#echo $( ps -C 'hyprsunset' >/dev/null && hyprctl dispatch -- exec hyprsunset -t 4500 || hyprctl dispatch -- exec kill $(pidof hyprsunset) )

if pidof -qx "hyprsunset"; then 
    hyprctl dispatch -- exec kill $(pidof hyprsunset)
else 
    hyprctl dispatch -- exec hyprsunset -t 4500
fi
