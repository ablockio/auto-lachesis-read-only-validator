#!/bin/bash

#######################################
# Bash script to launch a ready only lachesis node
# https://github.com/Fantom-foundation/lachesis_launch/blob/master/README.md#%23init-SFC-contract-context
#######################################
sudo apt-get update
sudo apt-get -y upgrade

# Install build-essential to install make
sudo apt-get install -y build-essential

# Install golang
wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz
sudo tar -xvf go1.13.3.linux-amd64.tar.gz
sudo mv go /usr/local

# Setup golang environment variables
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Installing go-lachesis
mkdir -p $HOME/go/src/github.com/Fantom-foundation
cd $HOME/go/src/github.com/Fantom-foundation/
git clone https://github.com/Fantom-foundation/go-lachesis.git
cd go-lachesis/
git checkout tags/v0.6.0-rc.2 -b lachesis-v6rc2
make build

# Joining the public mainnet
cd $HOME/go/src/github.com/Fantom-foundation/go-lachesis/build/
wget https://raw.githubusercontent.com/Fantom-foundation/lachesis_launch/master/releases/v0.6.0/mainnet.toml

# Start your node
./lachesis --config mainnet.toml --nousb
