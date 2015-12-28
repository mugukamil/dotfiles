# cd into whatever is the forefront Finder window
cdf() { cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"; }

# Update dotfiles
alias dotfiles="pushd "$HOME/dotfiles" > /dev/null 2>&1; git pull && ./sync.py && source "$HOME/.zshrc"; popd > /dev/null 2>&1; nyan"

# Magic Project Opener
repo() { cd "$("$HOME/dotfiles/bin/repo" $1)"; }

# HTTP requests by @janmoesen
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

# github.com/harthur/replace
alias replace="replace --exclude='node_modules'"

# Grunt
alias gw="grunt watch --stack --debug"
alias gww="grunt browserSync watch --stack --debug"

# Push and deploy using Shipit
alias pff="push && shipit"

# `cd` to Git repo root
alias gr='git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"'

alias zsh='vim ~/.zshrc'
alias c='clear'
alias v=vim
alias mysql=/Applications/MAMP/Library/bin/mysql
alias hosts='sudo $EDITOR /etc/hosts'
alias ccc='pygmentize -O style=monokai -f console256 -g'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'
alias safari="open -a safari"
alias firefox="open -a firefox"
alias opera="open -a opera"
alias chromium="open -a chromium"
alias vaprobash="curl -L http://bit.ly/vaprobash > Vagrantfile"
alias lamp="curl -L -o 'install.sh' http://bit.ly/1hBfq57 && curl -L -o 'Vagrantfile' http://bit.ly/1mE3Qt9 && vagrant up"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias ios="/Applications/Xcode.app/Contents/Developer/Applications/iOS\ Simulator.app/Contents/MacOS/iOS\ Simulator"
alias o="open"
alias oo="open ."
alias e="$EDITOR"
alias x+="chmod +x"
alias -- +x="chmod +x"
alias get="curl -O -L"
alias vaprobash="curl -L http://bit.ly/vaprobash > Vagrantfile"
