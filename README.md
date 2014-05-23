dotfiles
========

Install
-------

Clone and setup submodules:
```
git clone https://github.com/jonr22/dotfiles.git
cd dotfiles
git submodule init
git submodule upgrade
```

Setup soft links (i.e.):
```
ln -s dotfiles/vim/vimrc .vimrc
```

Included Files
--------------

File | Alias | Description
-----|-------|------------
.bash_aliases | dotfiles/bash/bash_aliases | default bash aliases
.bash_profile | dotfiles/bash/bash_profile | profile calls bashrc
.bashrc | dotfiles/bash/bashrc | bash configuration
.env | dotfiles/env | sets environment variables such as PATH, and RVM settings, this is called by both bash and zsh
.gitconfig | dotfiles/git/gitconfig | git settings such as aliases
.gitignore | dotfiles/git/gitignore | git globally ignored files
.oh-my-zsh | dotfiles/zsh/oh-my-zsh | [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
.tmux.conf | dotfiles/tmux/tmux.conf | tmux configuration settings
.vim | dotfiles/vim | vim directory, contains all plugins
.vimrc | dotfiles/vim/vimrc | vim configuration settings
.zshrc | zsh/zshrc | zsh configurations

Customizations
--------------

All local customizations should be made in these files:

* `.aliases` - aliases to be used by both zsh and bash
* `.vimrc.local` - vim customizations
* `.gitconfig.local` - local git settings such as user and email
* `.tmux.conf.local` - local tmux settings, mac and linux specific copy/paste settings can be used by linking to either `tmux/tmux.conf.mac` or `tmux/tmux.conf.linux`

Dependencies
------------

* [tmux 1.8](http://sourceforge.net/projects/tmux/files/tmux/tmux-1.8/) - to use tmux specific settings
* [rubocop](https://github.com/bbatsov/rubocop) - for ruby syntax validation (install via `gem` in `rvm`)
* [jshint](http://www.jshint.com/) - for javascript syntax validation (install via `npm`)
* [pyflakes](https://pypi.python.org/pypi/pyflakes) - for python syntax validation (install via `pip`)
* [jedi](https://github.com/davidhalter/jedi) - for improved python code completion (install via `pip`)
* [exuberant c-tags](http://ctags.sourceforge.net/)

Recomendations
--------------

* Set zsh as your login shell: `chsh -s $(which zsh)`
* [Solarized](http://ethanschoonover.com/solarized) color scheme. Colors for [iTerm2](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized)
and [gnome terminal](https://github.com/sigurdga/gnome-terminal-colors-solarized) are available.
* [Powerline fonts](https://github.com/Lokaltog/powerline-fonts) (used with Airline in vim) and set it as the default for your terminal.
I prefer [Meslo LG S Regular for Powerline](https://github.com/Lokaltog/powerline-fonts/blob/master/Meslo/Meslo%20LG%20S%20Regular%20for%20Powerline.otf).
* [brew](http://brew.sh/) to install packages on mac.
* [rvm](https://rvm.io/) to manage rubies.
* [pip](https://pypi.python.org/pypi/pip) to manage python modules.
* [npm](https://www.npmjs.org/) to install node packages. On linux use [nvm](https://github.com/creationix/nvm) to manage npm instances.

