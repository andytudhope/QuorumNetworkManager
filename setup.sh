#!/bin/bash

sudo apt-get update;
sudo apt-get install -y build-essential libssl-dev;

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 4.8.0
nvm use 4.8.0

wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz;
sudo tar -xvf go1.7.linux-amd64.tar.gz;
sudo cp -r go/ /usr/local/;
sudo rm -rf go/ go1.7.linux-amd64.tar.gz;

export GOROOT=/usr/local/go;
export GOPATH=$HOME/projects/go;
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH;

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install -y ethereum
sudo mv /usr/bin/geth /usr/bin/normalGeth

git clone https://github.com/jpmorganchase/quorum.git;
cd quorum/;
make all;
echo "PATH=\$PATH:"$PWD/build/bin >> ~/.bashrc;
source ~/.bashrc;

cd ..;
mkdir constellation && cd constellation/;
sudo apt-get install libdb-dev libsodium-dev zlib1g-dev libtinfo-dev unzip;
wget https://github.com/jpmorganchase/constellation/releases/download/v0.0.1-alpha/ubuntu1604.zip;
unzip ubuntu1604.zip;
chmod +x ubuntu1604/constellation-node;
chmod +x ubuntu1604/constellation-enclave-keygen;
echo "PATH=\$PATH:"$PWD/ubuntu1604 >> ~/.bashrc;
source ~/.bashrc;

cd ..;
git clone https://github.com/davebryson/quorum-genesis.git;
cd quorum-genesis/;
npm install -g;

cd ..;
git clone https://github.com/coeniebeyers/QuorumNetworkManager.git;
cd QuorumNetworkManager/;
npm install;
