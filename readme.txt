
For windows:

1, Unzip to the install directory of VIM, replace the existing directory 'vimfiles' and file '_vimrc'.

2, Execute  'install.bat'.

3, Add directory 'vimtools'  to  enviroment variable 'PATH'.

Now, you can use item 'Vim Tab' in the contex menu to edit a file with VIM.

-------------------------------------------------

Linux, for a single user:
1, Download the lastest version from github.
	cd
	git clone http://github.com:fanhongtao/vim.git
2. link  fht.vim as .vimrc
	cd
	ln -s  ~/vim/fht.vim  .vimrc
3. link directories into '.vim'
	cd ~/.vim
	ln -s ~/vim/vimfiles/autoload   autoload
	ln -s ~/vim/vimfiles/bundle     bundle
	ln -s ~/vim/vimfiles/colors     colors

