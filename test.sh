#!/bin/bash
function mustbeinstall(){
	read -n 1 option
	if [[ "$option" == "Y" || "$option" == "y" ]]; then
		retval=0
	else
		retval=1
	fi
	return "$retval"

}


#if [ "$EUID" -ne 0 ]
#  then echo "Please run as root"
#  exit 1
#fi


#--------------------------------
#Utils
#--------------------------------

echo "Installing Curl, Unzip, p7zip"
sudo apt install -y curl unzip p7zip 

#command -v foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }


#--------------------------------
#add to group sudo
#--------------------------------
echo "Add $USER to sudoers?: [y/n]"
mustbeinstall
retval=$?
if [ "$retval" == 0 ]
then
	adduser "$USER" sudo
	echo "Added $USER to group sudo"
fi

#---------------------------------
#sublime text
#---------------------------------
echo "Install Sublime Text: [y/n]"
mustbeinstall
retval=$?
if [ "$retval" == 0 ]
then 
	wget -O tmp-sublime-text.deb https://download.sublimetext.com/sublime-text_build-3103_amd64.deb
	dpkg -i tmp-sublime-text.deb
fi


#---------------------------------
#visual studio
#---------------------------------
echo "Install Visual Studio Code: [y/n]"
mustbeinstall
retval=$?
if [ "$retval" == 0 ]
then 
	#wget -O tmp-vscode.zip https://az764295.vo.msecnd.net/stable/f291f4ad600767626b24a4b15816b04bee9a3049/VSCode-linux-x64-stable.zip
	#unzip tmp-vscode.zip 
	sudo mv VSCode-linux-x64 vscode
	sudo cp -nR vscode /opt/
	sudo ln -s /opt/vscode/code /usr/bin/code

fi


#---------------------------------
#android studio
#---------------------------------
echo "Install Android Studio"
mustbeinstall
retval=$?
if [ "$retval" == 0 ]
then 
	wget -O tmp-androi-studio.zip https://dl.google.com/dl/android/studio/ide-zips/1.5.1.0/android-studio-ide-141.2456560-linux.zip
	unzip tmp-android-studio.zip -d tmp-android-studio
	sudo mv tmp-android-studio /opt/
	sudo ln -s /opt/tmp-addroid/bin/ /usr/bin/android-studio

fi

echo "Install Oracle JDK"
mustbeinstall
retval=$?
if [ "$retval" == 0 ]
then 
 	wget -O jdk-8u74-linux-x64.tar.gz --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jdk-8u74-linux-x64.tar.gz
	sudo apt-get install java-package
	make-jpkg jdk-8u74-linux-x64.tar.gz
	dpkg -i oracle-java8-jdk_*_amd64.deb
fi

#---------------------------------
#Golang
#---------------------------------
echo "Install Golang: [y/n]"
mustbeinstall
retval=$?
if [ "$retval" == 0 ]
	apt install golang
then 



#---------------------------------
#Elixir
#---------------------------------
echo "Install Golang: [y/n]"
mustbeinstall
retval=$?
if [ "$retval" == 0 ]
	apt install elixir
then 


#---------------------------------
#
#---------------------------------


curl https://install.meteor.com/ | sh








exit 1;
