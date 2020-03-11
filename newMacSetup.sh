#!/bin/bash

USERNAME="username"
USEREMAIL="useremail"

echo STARTING NEW MacOS SET UP!
if test ! $(which brew); then
    echo INSTALLING HOMEBREW...
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo updating brew...
brew update
echo INSTALLING CHROME...
if [  -d "/Applications/Google Chrome.app" ]; then
echo already exists
else 
brew cask install google-chrome
fi
echo INSTALLING VS CODE...
if [  -d "/Applications/Visual Studio Code.app" ]; then
echo already exists
else 
brew cask install google-chrome
fi
echo INSTALLING SLACK...
if [  -d "/Applications/Slack.app" ]; then
echo already exists
else 
brew cask install slack
fi
echo INSTALLING SOURCETREE...
if [  -d  "/Applications/Sourcetree.app" ]; then
echo already exists
else 
brew cask install sourcetree
fi
echo INSTALLING Git...
if test ! $(which git); then
brew install git
fi
echo INSTALLING Go...
if test ! $(which go); then
brew install go@1.12    
fi
echo INSTALLING POSTGRESQL...
if test ! $(which postgres); then
brew install postgresql@9.5
fi
echo INSTALLING MONGODB....
if test ! $(which mongo); then
brew tap mongodb/brew
brew install mongodb-community@4.2
fi
echo CONFIGURING GIT....
git config --global user.name $USERNAME
git config --global user.email $USEREMAIL
echo CONFIGURING Go...
echo SETTING UP GO WORKSPACE...
mkdir ~/go
mkdir ~/go/src
mkdir ~/go/bin
echo SETTING UP PATH...
echo 'export GOPATH=~/go' >> ~/.bash_profile
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bash_profile
echo CONFIGURING POSTGRESQL...
echo 'export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"' >> ~/.bash_profile
echo EXPORTING FLAGS...
export LDFLAGS="-L/usr/local/opt/postgresql@9.5/lib"
export CPPFLAGS="-I/usr/local/opt/postgresql@9.5/include"
