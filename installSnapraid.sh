#!/bin/bash
apt update
apt install gcc make -y
mkdir /var/lib/snapraid
chmod a+w /var/lib/snapraid
cd /var/lib/snapraid
wget https://github.com/amadvance/snapraid/releases/download/v11.3/snapraid-11.3.tar.gz
tar xzf snapraid-11.3.tar.gz 
cd snapraid-11.3/
./configure
make
make check
make install
