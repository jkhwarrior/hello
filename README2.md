Users and sudo
Debian's default configuration allows users in the sudo group
to run command via sudo.

Add existing user from commandline
# sudo adduser USERNAME sudo

Alternatively you can first get root (sudo su) and then run the
same commands without prefix=sudo
# adduser USERNAME
# adduser USERNAME sudo
After being added to a new group the user must log out and then log back in again for the new group to take effect. Groups are only assigned to users at login time. A most common source of confusion is that people add themselves to a new group but then do not log out and back in again and then have problems because the group is not assigned
/etc/sudoers    
%sudo   ALL=(ALL:ALL) ALL
A typical error using sudo to install a package might result in:


dpkg: warning: 'ldconfig' not found in PATH or not executable.
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"


Downloading Vim
Vim is available for many different systems and there are several versions. This page will help you decide what to download
https://www.vim.org/download.php

Using git
This is the simplest and most efficient way to obtain the latest version, including all patches. This requires the "git" command.
The explanations are on the GitHub page.
Summary:

git clone https://github.com/vim/vim.git
cd vim/src
make

Debian packages are available at: http://packages.debian.org/vim.

Solution 2 :
Otherwise, you can compile Vim from source code (assuming you're using Debian based system)

Prepare your system
Install

sudo apt install libncurses5-dev \
libgtk2.0-dev libatk1.0-dev \
libcairo2-dev python-dev \
python3-dev git
Remove Vim if you already have

sudo apt remove vim vim-runtime gvim  
configure and make
cd /usr && sudo git clone https://github.com/vim/vim.git && cd vim  

sudo ./configure --with-features=huge \
--enable-multibyte \
--enable-pythoninterp=yes \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \  # pay attention here check directory correct
--enable-python3interp=yes \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ \  # pay attention here check directory correct
--enable-gui=gtk2 \
--enable-cscope \ 
--prefix=/usr/local/

sudo make VIMRUNTIMEDIR=/usr/local/share/vim/vim81 
Preparing deb package using checkinstall
And install that package

cd /usr/vim && sudo checkinstall
Or, if want to just create a package use --install=no option with checkinstall

Set Vim as a default editor
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim   
Verify that you're running the new Vim binary by looking
vim --version | grep python
