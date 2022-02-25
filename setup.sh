#!/bin/bash

echo "Setup runner env"

echo "Turn off Spotlight indexing"

sudo mdutil -a -i off

echo "Disable swap"

sudo nvram boot-args="vm_compressor=2"

echo "Install homebrew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap homebrew/cask 
brew tap homebrew/cask-versions 
brew tap homebrew/services

echo "Install homebrew tools"

brew install git git-lfs hub htop aria2

brew install robotsandpencils/made/xcodes

echo "Install rvm"

curl -sSL https://get.rvm.io | bash -s stable --ruby

source $HOME/.rvm/scripts/rvm

echo "Install ruby 2.7.2"

rvm install ruby-2.7.2 --default

echo "Install cocoapods"

gem install cocoapods

echo "Install jazzy"

gem install jazzy

echo "Install xcode (latest) to /Applications/Xcode.app"

xcodes install --latest

XCODE_VERSIONS="13.2.1 13.2"

for version in $XCODE_VERSIONS
do
	echo "Install xcode version $version"
	xcodes install $version
done

echo "Logout xcodes"

xcodes signout

echo "Select xcode"

xcodes select 13.2.1

echo "Install xcode tools"

gem install xcpretty xcode-install

echo "Install nvm"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

source $HOME/.zshrc

echo "Install node v16"

nvm install v16

echo "Install yarn"

npm install --global yarn

echo "Setup for ruby/setup-ruby@v1"

sudo mkdir -p /Users/runner/hostedtoolcache

sudo chown -R `whoami`:staff /Users/runner/hostedtoolcache