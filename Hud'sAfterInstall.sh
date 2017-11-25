#!/bin/bash
echo "Updating system"
apt-get update -y
#Install nautilus wireshark tcpdump and tshark
apt-get install nautilus wireshark tcpdump tshark -y
#Install suricata
echo "Installing Libpcre..."
apt-get install libpcre3-dbg libpcre3-dev autoconf automake libtool libpcap-dev libnet1-dev libyaml-dev zlib1g-dev libcap-ng-dev libmagic-dev libjansson-dev libjansson4 -y
echo "Installing Libnetfilter..."
apt-get install libnetfilter-queue-dev libnetfilter-queue1 libnfnetlink-dev
echo "Downloading suricata-3.1.1... "
wget http://www.openinfosecfoundation.org/download/suricata-3.1.1.tar.gz
echo "Extracting Suricata..."
tar -zxf suricata-3.1.1.tar.gz
echo "Locating extrated folder..."
cd suricata-3.1.1/
echo "Building Surcata with IPS capabilities..."
./configure --enable-nfqueue --prefix=/usr --sysconfdir=/etc --localstatedir=/var
echo "Installing Suricata..."
make &amp;&amp; make install-conf
echo "Installing Suricata rules..."
make install-rules

touch ./NextInstructionS.txt
echo
"
ls /etc/suricata/rules
vim /etc/suricata/suricata.yaml
ethtool -K eth0 gro off lro off
/usr/bin/suricata --list-runmodes
/usr/bin/suricata -c /etc/suricata/suricata.yaml -i ens160 --init-errors-fatal
" > NextInstructionS.txt
