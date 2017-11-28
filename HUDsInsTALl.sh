#!/bin/bash

#Hud Seidu Daannaa MSc, CEH
#Information Security


#user = echo $(pwd)| grep -i 'home'| cut -d"e" -f2| cut -d"/" -f2
echo ' '
echo ' '
echo '[!] TheHudScript4InstallingBasicWorkingToolS ...........................'
echo '[!] Starts with EthicalHacking&Anonymity Tools..........................'
echo '[!] +_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_'
echo ' '
echo '[(] Enter PassPhrase for Sudo, To continue /////////////////////////////'
read -s pass
echo '________________________________________________________________________'
echo ' '
echo ' '

#this checks passwords availability
#echo  | sudo -S apt install python -y > /dev/null
#sudo apt-get update
#if [ $user -eq echo $(whoami) ]; then

#optional and additional programs that can be added#
#tree links lynx autopsy sqlmap dradis hydra aircrack-ng IBM appscan 
#nikto ettercap openvas
#beef veil-evasion zap burpsuite nessus netsparker w3af

#############################################################################'

## more tools can be added to the array declare to install more programs
#if [ $? -eq 0 ]; then
declare -a arr=("tshark" "wireshark" "nmap" "scapy" "strings" 
"traceroute" "tcpdump" "nautilus" "tree" "lynx" "links"
"beef" "autopsy" "nikto" "w3af")

## now loop through the above array
for program_ in "${arr[@]}"
do
	type $program_ > /dev/null
	if [ $? -eq 0 ]; then echo "[+] $program_ exists"
	else echo $pass | sudo -S apt install $program_ -y 
	fi
done
#############################################################################'
echo ' '
echo ' '
echo '[=] Done !!! ...........................................................'
echo ' '
echo ' '

echo '[!] installing anonymity tools'
echo '[!] { Tor, ProxyChains, Privoxy, Tsocks} '
echo '[!] +_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_'
echo ' '
#tsocks, tor, privoxy, proxychains

#install tor
type tor > /dev/null	
if [ $? -eq 0 ]; then echo '[+] tor exists'
else echo $pass | sudo -S apt install tor -y 
fi

#install privoxy
type privoxy > /dev/null	
if [ $? -eq 0 ]; then echo '[+] privoxy exists'
else
	echo '[*] Configuring servers {Privoxy} ..................................' 
	echo $pass | sudo -S apt install privoxy -y
	#configuring privoxy
	echo $pass | sudo -S "forward-socks5 / localhost:9050 ." >>/etc/privoxy/config
fi

#install tsocks
type tsocks > /dev/null	
if [ $? -eq 0 ]; then echo '[+] tsocks exists'
else
	echo '[*] Configuring servers {tsocks} ...................................' 
	echo $pass | sudo -S apt install tsocks -y
	#configuring tsocks
	sed -i s/server =/server = 127.0.0.1/g /etc/tsocks.conf
	# Server type defaults to 4 so we need to specify it as 5 for this one
	sed -i s/server_type =/server_type = 5/g /etc/tsocks.conf
	# The port defaults to 1080 but I've stated it here for clarity 
	#server_port = 9050
	sed -i s/server_port =/server_port = 9050/g /etc/tsocks.conf
fi

#install proxychains
type proxychains > /dev/null	
if [ $? -eq 0 ]; then echo '[+] proxychains exists'
else
	echo '[*] Configuring servers {ProxyChains} ..............................' 
	#configuring proxychains
	echo $pass | sudo -S apt install proxychains -y
	#After adding the http proxy to the list its time to start an http proxy server 
	#on localhost (127.0.0.1). This can be done by either installing TOR 
	#Polipo or by simply launching the burp suite program which has an integrated 
	#http proxy server. Once the http proxy server is up, launch proxychains along 
	#with the application that needs to be proxified
	echo $pass | sudo -S "http	127.0.0.1	8080" >> /etc/proxychains/proxychains.conf
	#Comment out proxy_dns option, otherwise it will be difficult to make it work.  
	sed -i s/proxy_dns/#proxy_dns/g /etc/proxychains/proxychains.conf

fi

echo ' '
echo ' '
echo '[!] Done !!!............................................................'
echo ' '
echo ' '

#start servers
#service tor start
#service privoxy start

#follow file to firefox configuration
f_path=$(pwd)/Desktop/for_firefox.txt
if [ -f $f_path ]
then 
	rm $f_path
	touch $(pwd)/Desktop/for_firefox.txt
	echo 'http proxy = localhost:8118' > $(pwd)/Desktop/for_firefox.txt
	echo '[)] created new help file, check desktop ...'
else 
	touch $(pwd)/Desktop/for_firefox.txt
	echo 'http proxy = localhost:8118' > $(pwd)/Desktop/for_firefox.txt
	echo '[)] created new help file, check desktop ...'
fi

#AV tools
##############################################################################
echo ' '
echo ' '
echo '[=] Done !!! ...........................................................'
echo ' '
echo ' '

echo '[!] installing AVS tools'
echo '[!] Tor, ProxyChains, Privoxy, Tsocks'
echo '[!] +_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_'
echo ' '
#else
#echo ')))))'
#echo 'Please enter system Password as required by sudo for installations'
#fi
