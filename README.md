#dotfiles

##About

These are the dotfiles I set up on both OSX and linux machines. These configurations mostly apply to
vim, tmux, and zsh, but I also have some bash configurations for the rare cases where I can't use zsh.
A lot of the credit for these configuration is owed to [Square's](http://square.github.io/) *[Maximum Awesome](https://github.com/square/maximum-awesome)*
and [Thoughtbot's](http://thoughtbot.com/) *[dotfiles](https://github.com/thoughtbot/dotfiles)*.

##Install

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

##Included Files

Alias| File | Description
-----|------|------------
`.bash_aliases` | `bash/bash_aliases` | Some bash specific aliases (with zsh most of these are handled via oh-my-zsh), such as `la` and `ll` as well as other common aliases.
`.bash_profile` | `bash/bash_profile` | The bash profile, this just calls bashrc so that everything is funneled through one configuration.
`.bashrc` | `bash/bashrc` | The main bash configuration file. This sources `bash_aliases`, `aliases`, and `env`, and sets some standard configuration settings.
`.env` | `env` | Sets environment variables such as PATH and RVM settings. It checks for certain files and folders and then adds them to the path if they exist. This is called by both zsh and bash.
`.gitconfig` | `git/gitconfig` | The git configuration file, it contains aliases (described below) and some other common settings.
`.gitignore` | `git/gitignore` | Files that git should ignore globally.
`.oh-my-zsh` | `zsh/oh-my-zsh` | The [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) package. This contains many aliases and other helpful settings.
`.tmux.conf` | `tmux/tmux.conf` | Configuration settings for tmux. Some of these settings are described below. They are all platform independent. For mac / linux specific settings (mainly for copy/paste) see the `tmux/tmux.conf.mac` and `tmux/tmux.conf.linux` files described below.
`.vim` | `vim` | The vim directory, this contains all vim plugins/bundles as submodules.
`.vimrc` | `vim/vimrc` | The vim configuration settings. Some of these settings are described below.
`.zshrc` | `zsh/zshrc` | The main zsh configuration file. This sources `aliases`, `env`, and `oh-my-zsh`.

##Customizations

All local customizations should be made in these files:

* `.aliases` - aliases to be used by both zsh and bash
* `.vimrc.local` - vim customizations
* `.gitconfig.local` - local git settings such as user and email
* `.tmux.conf.local` - local tmux settings, mac and linux specific copy/paste settings can be used by linking to either `tmux/tmux.conf.mac` or `tmux/tmux.conf.linux`

##Dependencies

* [tmux 1.8](http://sourceforge.net/projects/tmux/files/tmux/tmux-1.8/) - to use tmux specific settings
  * with tmux on mac, `reattach-to-user-namespace` should be installed via brew and used in combinatiion with `tmux/tmux.conf.mac` in order to enable system wide copy/paste functionality
* [rubocop](https://github.com/bbatsov/rubocop) - for ruby syntax validation (install via `gem` in `rvm`)
* [jshint](http://www.jshint.com/) - for javascript syntax validation (install via `npm`)
* [pyflakes](https://pypi.python.org/pypi/pyflakes) - for python syntax validation (install via `pip`)
* [jedi](https://github.com/davidhalter/jedi) - for improved python code completion (install via `pip`)
* [exuberant c-tags](http://ctags.sourceforge.net/)

##Recomendations

* Set zsh as your login shell: `chsh -s $(which zsh)`
* [Solarized](http://ethanschoonover.com/solarized) color scheme. Colors for [iTerm2](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized)
and [gnome terminal](https://github.com/sigurdga/gnome-terminal-colors-solarized) are available.
* [Powerline fonts](https://github.com/Lokaltog/powerline-fonts) (used with Airline in vim) and set it as the default for your terminal.
I prefer [Meslo LG S Regular for Powerline](https://github.com/Lokaltog/powerline-fonts/blob/master/Meslo/Meslo%20LG%20S%20Regular%20for%20Powerline.otf).
* [brew](http://brew.sh/) to install packages on mac.
* [rvm](https://rvm.io/) to manage rubies.
* [pip](https://pypi.python.org/pypi/pip) to manage python modules.
* [npm](https://www.npmjs.org/) to install node packages. On linux use [nvm](https://github.com/creationix/nvm) to manage npm instances.

##Settings

### vim

* `,d` brings up [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
* `,t` brings up [ctrlp.vim](https://github.com/kien/ctrlp.vim), a project file filter for easily opening specific files
* `,b` restricts ctrlp.vim to open buffers
* `,g` show git changes in the gutter
* `,]` rebuild tags
* `,c` close buffer properly
* `:w!!` save read only file via sudo
* `,a` starts project search with [ack.vim](https://github.com/mileszs/ack.vim) using [the silver searcher](https://github.com/ggreer/the_silver_searcher) (like ack, but faster)
* `,V` reload vimrc
* `,y` yank to system clipboard
* `,p` paste from system clipboard
* `ds`/`cs` delete/change surrounding characters (e.g. `"Hey!"` + `ds"` = `Hey!`, `"Hey!"` + `cs"'` = `'Hey!'`) with [vim-surround](https://github.com/tpope/vim-surround)
* `gcc` toggles current line comment
* `gc` toggles visual selection comment lines
* `,[space]` strips trailing whitespace (this is also done automatically on save/write)
* `<C-]>` jump to definition using ctags
* `,l` begins aligning lines on a string, usually used as `,l=` or `,l:` to align assignments
* `<C-hjkl>` move between windows, shorthand for `<C-w> hjkl` (also navigates to tmux via [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator))

### tmux

* `<C-a>` is the prefix
* `prefix v` makes a vertical split
* `prefix s` makes a horizontal split
* `prefix <C-v>` makes a 25% vertical split
* `prefix <C-s>` makes a 25% horizontal split
* `<C-hjkl>` move between panes with no prefix needed (also navigates to vim via [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator))

### git

* `git lg` colorful graph log
* `git st` simplified status
* `git co` checkout
* `git ci` commit
* `git d` diff
* `git dc` diff --cached
* `git b` branch
* `git ba` branch -a
* `git logb` log --first-parent (this only looks at changes made on the specific branch, ignoring changes made to merged in branches)
* `git lgb` logb in color in short form

