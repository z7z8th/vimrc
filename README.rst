Quick installation
==================
Simply run this script to install and configure this vimrc in your `$HOME`
dir::

	wget -O - https://github.com/z7z8th/vimrc/raw/master/autoinstall.sh | sh

If you have cloned this repo(i.e.: in .vim), run the following command to finish 
installation::

	cd .vim
	./autoinstall.sh post

Installing this vimrc manually
==============================
Although a vimrc is a very personal thing, you may use mine if you
like it.  To do so, please do the following:

1. Clone this repo::
   	cd ~/
   	git clone git://github.com/z7z8th/vimrc.git .vim

   or download the plain source only::

   	wget -qO - http://github.com/z7z8th/vimrc/tarball/master | tar -xzvf -
   	mv vimrc ~/.vim

2. Fetch submodules::

   	git submodule init
   	git submodule update

3. Recompile Command-T Ruby C extension for your platform::

   	cd ruby/command-t
   	ruby extconf.rb
   	make clean; make

4. Create Symlinks::

   	ln -s ~/.vim/vimrc ~/.vimrc

5. Touch::

   	touch ~/.vim/user.vim

That's it.
