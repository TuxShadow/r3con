#!/bin/sh

DS='\e[033;0m'
green='\e[032;1m'
red='\e[031;1m'
yellow='\e[033;1m'

echo  " $green

 _______ ______  _______ _______ _       
(  ____ / ___  \(  ____ (  ___  ( (    /|
| (    )\/   \  | (    \| (   ) |  \  ( |
| (____)|  ___) | |     | |   | |   \ | |
|     __) (___ (| |     | |   | | (\ \) |
| (\ (        ) | |     | |   | | | \   |
| ) \ \_/\___/  | (____/| (___) | )  \  |
|/   \__\______/(_______(_______|/    )_)
                                         

                                                   
                                                                  $DS"


banner(){

	  which curl > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo  "\e[31;1m curl -----------------------  \e[32;1m [OK] \e[0m"
       else
       	
       	echo ""
       	echo "DO U WANT INSTALL curl ? (YES|NO) "
       	read jawaban
       	if [[ $jawaban="YES" || $jawaban="yes" || $jawaban="y" || $jawaban="" ]]; then
       		apt-get update
       		apt-get install curl
       	else	
       		exit
       	fi
       	fi
       	sleep 1

}

banner 



cek(){
	  which curl > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo -e "\e[31;1m curl -----------------------  \e[32;1m [OK] \e[0m"
       else
       	
       	echo ""
       	echo "DO U WANT INSTALL curl ? (YES|NO) "
       	read jawaban
       	if [[ $jawaban="YES" || $jawaban="yes" || $jawaban="y" || $jawaban="" ]]; then
       		apt-get update
       		apt-get install curl
       	else	
       		exit
       	fi
       	fi
       	sleep 1
}

 
while getopts 'chsdwra :' OPTION; do
  case "$OPTION" in
    s)
		  read -p " [+] Target : " target
      curl 'http://api.hackertarget.com/hostsearch/?q='$target --compressed
      echo ""
			;;

    h)
		echo "$green"
      echo "========================================="
      echo "Usage : "
			
			echo "-h help"
			echo "-s Subdomain Scan"
			echo "-d DNS lookup"
			echo "-w WhoIs"
			echo "-r Reverse DNS"
			echo "-a Check HTTP Headers"
			echo "-c Completer Scan"
      echo "========================================= $DS"
			
			;;
    d)
		  read -p " [+] Target : " target
      curl 'https://api.hackertarget.com/dnslookup/?q='$target --compressed
      echo ""
			;;
    w)
		  read -p " [+] Target : " target
      curl 'https://api.hackertarget.com/whois/?q='$target --compressed
      echo ""
			;; 
    r)
		  read -p " [+] Target : " target
      curl 'https://api.hackertarget.com/reversedns/?q='$target --compressed
      echo ""
			;;   
		a)
		  read -p " [+] Target : " target
		  curl 'https://api.hackertarget.com/httpheaders/?q='$target --compressed
			echo ""
			;;
    c)
		  read -p " [+] Target : " target
			echo ""
		  echo "$red ================Subdomain================ $DS"
		  echo ""
		  curl 'http://api.hackertarget.com/hostsearch/?q='$target --compressed
		  echo ""
		  echo "$yellow ==================DNS==================== $DS"
      echo ""
		  curl 'http://api.hackertarget.com/dnslookup/?q='$target --compressed
		  echo ""
		  echo "$green =================Reverse================= $DS"
		  echo ""
		  curl 'https://api.hackertarget.com/reversedns/?q='$target --compressed
		  echo ""
			echo "$yellow =================HTTP Headers============ $DS"
			echo ""
			curl 'https://api.hackertarget.com/httpheaders/?q='$target --compressed
			echo ""
		  echo "$green =================WhoIs=================== $DS"
		  echo ""
		  curl 'https://api.hackertarget.com/whois/?q='$target --compressed
		  echo ""
      ;;
		?)
      echo "script usage: $(basename $0) $yellow [-h] [-s] [-d] [-w] [-r] [-c] $DS " >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"





