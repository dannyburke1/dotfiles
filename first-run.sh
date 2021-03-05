#!/bin/sh

set -e

echo "Checking Homebrew is installed..."
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Setup hostname"
sudo scutil --set HostName danny-macbook

echo "Install with Brew Bundle"
set +e
export PATH=$PATH:/opt/homebrew/bin
brew bundle
set -e

echo "Creating directories..."
mkdir -p ~/personal
mkdir -p ~/customers