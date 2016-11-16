#!/bin/bash
sudo -v

brew update

brew upgrade --all

brew install coreutils
brew install moreutils
brew install gnu-sed --with-default-names
brew install findutils

brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz
brew install ack
brew install aircrack-ng
brew install ansible
brew install autojump
brew install berkeley-db
brew install c-ares
brew install cask
brew install casperjs
brew install cowsay
brew install crunch
brew install ctags
brew install cups-pdf
brew install dark-mode
brew install dbus
brew install dnsmasq
brew install dnstracer
brew install emacs
brew install ettercap
brew install fdupes
brew install ffmpeg
brew install fonttools
brew install fortune
brew install fragroute
brew install geoip
brew install gifsicle
brew install gnutls
brew install gperftools
brew install graphicsmagick
brew install hping
brew install htop
brew install httpie
brew install hydra
brew install ifstat
brew install imagemagick
brew install libgcrypt
brew install libnids
brew install homebrew/dupes/libpcap
brew install libvo-aacenc
brew install lighttpd
brew install macvim
brew install memtester
brew install mycli
brew install mysql
brew install newlisp
brew install ngrep
brew install nikto
brew install node
brew install nvm
brew install optipng
brew install perl
brew install homebrew/php/php-cs-fixer
brew install homebrew/php/php70-mcrypt
brew install homebrew/php/phplint
brew install pngquant
brew install protobuf
brew install pv
brew install python
brew install python3
brew install qt
brew install reaver
brew install rethinkdb
brew install ruby
brew install snort
brew install thefuck
brew install tmux
brew install trash
brew install tree
brew install unrar
brew install vim
brew install watchman
brew install wget
brew install z
brew install zsh
brew install ack
brew install dark-mode
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install vbindiff
brew install webkit2png
brew install zopfli
brew install htop
brew install the_silver_searcher
brew install gist
brew install ttfautohint fontforge --with-python
brew install msmtp --with-macosx-keyring
brew install mutt --sidebar-patch

# Git
brew install git
brew install git-extras
brew install git-lfs
brew install hub
sudo bash < <( curl https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh)

# Extend global $PATH
echo -e "setenv PATH $HOME/Dropbox/DOTFILES/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin" | sudo tee /etc/launchd.conf

# nvm
brew install nvm
mkdir "$HOME/.nvm"
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
nvm install stable
nvm use stable
nvm alias default stable

# Node.js
brew install casperjs
npm config set loglevel warn
npm config set save-prefix '~'
npm install -g grunt-cli
npm install -g gulp
npm install -g yo
npm install -g jshint
npm install -g eslint
npm install -g jscs
npm install -g bower
npm install -g docpad
npm install -g npm-check-updates

# Python
brew install python

# Remove outdated versions from the cellar
brew cleanup
