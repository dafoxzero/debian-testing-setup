
#!/bin/bash
#if [ "$EUID" -ne 0 ]
#  then echo "Please run as root"
#  exit 1
#fi
#command -v foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }

#--------------------------------
# Add user to sudoers
#--------------------------------
su - #login as root
apt-get install sudo
adduser <username> sudo
#logout

#--------------------------------
# tools
#--------------------------------
sudo apt install -y curl unzip p7zip 

#---------------------------------
# git
#---------------------------------
sudo apt install -y git

git config --global user.email "<email>"
git config --global user.name <name>

sudo apt install git-flow  #(optional)

#---------------------------------
# oh-my-zsh
#---------------------------------
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
#logout


#---------------------------------
#sublime text
#---------------------------------
wget -O tmp-sublime-text.deb https://download.sublimetext.com/sublime-text_build-3103_amd64.deb
dpkg -i tmp-sublime-text.deb


#---------------------------------
#visual studio
#---------------------------------
wget -O tmp-vscode.zip https://az764295.vo.msecnd.net/stable/f291f4ad600767626b24a4b15816b04bee9a3049/VSCode-linux-x64-stable.zip
unzip tmp-vscode.zip 
sudo mv VSCode-linux-x64 vscode
sudo cp -nR vscode /opt/
sudo ln -s /opt/vscode/code /usr/bin/code


#---------------------------------
# android studio
#---------------------------------
<<<<<<< HEAD
wget -O tmp-androi-studio.zip https://dl.google.com/dl/android/studio/ide-zips/1.5.1.0/android-studio-ide-141.2456560-linux.zip
unzip tmp-android-studio.zip -d tmp-android-studio
sudo cp -nR tmp-android-studio /opt/
sudo ln -s /opt/tmp-addroid/bin/ /usr/bin/android-studio
=======
echo "Install Elixir: [y/n]"
mustbeinstall
retval=$?
if [ "$retval" == 0 ]
	apt install elixir
then 
>>>>>>> 18d26bcd60e14809188440c46836b3099d7c64e3

#--------------------------------
# oracle java
#--------------------------------
wget -O tmp-oracle-java.deb https://www.dropbox.com/s/1rbvem9r20hdozj/oracle-java8-jdk_8u74_amd64.deb?dl=0
sudo dpkg -i tmp-oracle-java.deb

#---------------------------------
#Golang, elixir
#---------------------------------
sudo apt install -y golang 
sudo apt install -y elixir 


#--------------------------------
# nodejs 5
#--------------------------------
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt install -y nodejs

#---------------------------------
# Meteor
#---------------------------------
curl https://install.meteor.com/ | sh
