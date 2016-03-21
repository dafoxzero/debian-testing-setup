debian-testing-setup


ssh-keygen -t rsa -b 4096 -C "dafoxzero@gmail.com"

ssh-add ~/.ssh/id_rsa

sudo apt install xclip

xclip -sel clip < ~/.ssh/id_rsa.pub

@ paste on https://github.com/settings/ssh

