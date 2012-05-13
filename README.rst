Quick installation
==================
Simply run this script to install and configure this vimrc in your `$HOME`
dir::

	wget -O - https://github.com/nvie/vimrc/raw/master/autoinstall.sh | sh

Installing this vimrc manually
==============================
Although a vimrc is a very personal thing, you may use mine if you
like it.  To do so, please do the following:

1. Clone this repo::

   	git clone git://github.com/nvie/vimrc.git

   or download the plain source only::

   	wget -qO - http://github.com/nvie/vimrc/tarball/master | tar -xzvf -

2. Fetch submodules::

   	git submodule init
   	git submodule update

3. Recompile Command-T Ruby C extension for your platform::

   	cd vim/ruby/command-t
   	ruby extconf.rb
   	make clean; make

4. Create Symlinks::

   	ln -s path/to/vimrc/vimrc ~/.vimrc
   	ln -s path/to/vimrc/vim ~/.vim

5. Touch::

   	touch ~/.vim/user.vim

That's it.
