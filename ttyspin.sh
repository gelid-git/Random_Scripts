#!/bin/bash

#### Author: Gelid
#### Usage: Rotates all the ttys on machines that support the path and rotate_all.
#### Does not rotates pts so it is not too useful. But will still cause a headache for anyone with physical access and no gui.
#### Consider placing the path to the script in /etc/rc.local, or place the file in the /etc/network/if-pre-up.d/ directory.
#### Change the value of num to incrase or decrease the speed of the rotation.

num=.25
while [ 1 ]
do
    for i in `seq 0 3`;
    do
        echo $i | sudo tee /sys/class/graphics/fbcon/rotate_all > /dev/null 2>&1
        sleep $num
    done
done &
