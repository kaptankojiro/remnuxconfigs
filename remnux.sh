#!/bin/bash

HEIGHT=20
WIDTH=60
CHOICE_HEIGHT=12
BACKTITLE="Remnux Docker Containers"
TITLE="Remnux Dockers"
MENU="Choose one of the following options:"

OPTIONS=(1 "Thug Low-Interaction Honeyclient"
         2 "JSDetox JavaScript Analysis Tool"
         3 "de4js JavaScript Deobfuscator and Unpacker"
	 4 "Rekall Memory Forensic and IR"
	 5 "RetDec Retargetable Machine-Code Decompiler"
	 6 "Rizin Reverse-Engineering Framework"
	 7 "Radare2 Reverse-Engineering Framework"
	 8 "Viper Binary Analysis and Management Framework"
	 9 "Ciphey Automatic Decoder and Decrypter"
	 10 "Update All Dockers"
	 11 "Update Remnux Components"

)

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
         1)
            docker run --rm -it --entrypoint "/bin/bash" remnux/thug
            ;;
         2)
            docker run -d --rm --name jsdetox -p 3000:3000 remnux/jsdetox
            ;;
         3)
             docker run -d --rm -p 4000:4000 -p 35729:35729 --name de4js remnux/de4js
            ;;

	 4)
            docker run --rm -it -v <files_directory>:/home/nonroot/files remnux/rekall bash
            ;;

 	 5)
            docker run -it --rm -v <files_directory>:/tmp/files remnux/retdec bash
            ;;

 	 6)
            docker run --rm -it -v ~/workdir:/home/nonroot/workdir remnux/rizin
            ;;

 	 7)
            docker run --rm -it -v ~/workdir:/home/nonroot/workdir remnux/radare2
            ;;

 	 8)
            docker run -it --rm -v ~/workdir:/home/nonroot/workdir remnux/viper
            ;;


 	9)
            docker run -it --rm -v ~/workdir:/home/nonroot/workdir remnux/ciphey -f input.txt 
            ;;

 	10)
            docker images |cut -d' ' -f1 | grep -v REPOSITORY | xargs -I %s docker pull %s
            ;;

 	11)
            remnux update
            ;;

esac
