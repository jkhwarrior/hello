sudo ./configure --with-features=huge \
--enable-multibyte \
--enable-rubyinterp \
--enable-pythoninterp=yes \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
--enable-python3interp=yes \
--with-python-config-dir=/usr/lib/python3.9/config-3.9-x86_64-linux-gnu/ \
--enable-luainterp \
--enable-perlinterp \
--enable-gui=gtk2 \
--enable-cscope \
--prefix=/usr/local/
make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
sudo make install
