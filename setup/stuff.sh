#!/bin/bash

# Installs Homebrew, Git, git-extras, git-friendly, hub, Node.js, etc.

# Ask for the administrator password upfront
sudo -v

# Install Homebrew
#command -v brew >/dev/null 2>&1 || ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# More recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
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

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2
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

# Git
brew install git
brew install git-extras
brew install git-lfs
brew install hub
sudo bash < <( curl https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh)

# Extend global $PATH
echo -e "setenv PATH $HOME/Dropbox/DOTFILES/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin" | sudo tee /etc/launchd.conf

# Everything else
brew install the_silver_searcher
brew install unrar
brew install gist
brew install ttfautohint fontforge --with-python
brew install msmtp --with-macosx-keyring
brew install mutt --sidebar-patch

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
npm install -g jscs
npm install -g bower
npm install -g docpad
npm install -g npm-check-updates

# Python
brew install python

# Remove outdated versions from the cellar
brew cleanup
