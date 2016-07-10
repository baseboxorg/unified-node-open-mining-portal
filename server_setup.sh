

#!/bin/bash

set -xe

if [ ! -e /usr/lib/apt/methods/https ]; then
	apt-get update
	apt-get install -y curl apt-transport-https
fi

#apt-get update
#apt-get dist-upgrade


#dd if=/dev/zero of=/mnt/myswap.swap bs=1M count=4000
#mkswap /mnt/myswap.swap
#swapon /mnt/myswap.swap

# nano /etc/fstab
# /mnt/myswap.swap none swap sw 0 0


curl https://repogen.simplylinux.ch/txt/trusty/sources_47ce9f463a8d4fc9a61e3ed3bbc186d14ae69cd7.txt | tee /etc/apt/sources.list
apt-get install build-essential libtool autotools-dev autoconf pkg-config libssl-dev
apt-get install libboost-all-dev git npm nodejs nodejs-legacy libminiupnpc-dev redis-server
add-apt-repository ppa:bitcoin/bitcoin
apt-get update
apt-get install libdb4.8-dev libdb4.8++-dev
curl https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | sh
source ~/.profile
nvm install 0.10.25
nvm use 0.10.25






# create user if on vm server
# adduser usernameyourwant
# adduser usernameyousetup sudo
# reboot

git clone https://github.com/litecoin-project/litecoin.git

cd litecoin
sudo ./autogen.sh
sudo ./configure
sudo make
sudo make install


cd src
./litecoind


mkdir -p /home/vagrant/.litecoin
cp litecoin.conf /home/vagrant/.litecoin/litecoin.conf


cd
cd litecoin/src
./litecoind
