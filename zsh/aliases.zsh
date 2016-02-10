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

# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# Magic project Opener
repo() { cd "$("$HOME/dotfiles/bin/repo" $1)"; }

# My IP
alias myip="ifconfig | grep 'inet' | grep -v 127.0.0.1 | awk '{print \$2}'"

# Download file
alias get="curl -O -L"

# HTTP Request
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# Grunt
alias gw="grunt watch --stack --debug"
alias gww="grunt browserSync watch --stack --debug"

# Tamia generator
tm() { yo tamia:$@; }

# File Size
alias fs="stat -f \"%z bytes\""

# find shorthand
function f() {
  find . -name "$1"
}


# List all files, long format, colorized, permissions in octal
function la() {
 	ls -l  "$@" | awk '
    {
      k=0;
      for (i=0;i<=8;i++)
        k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));
      if (k)
        printf("%0o ",k);
      printf(" %9s  %3s %2s %5s  %6s  %s %s %s\n", $3, $6, $7, $8, $5, $9,$10, $11);
    }'
}

function gifify() {
  if [[ -n "$1" ]]; then
	if [[ $2 == '--good' ]]; then
	  ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
	  time convert -verbose +dither -layers Optimize -resize 900x900\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
	  rm out-static*.png
	else
	  ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
	fi
  else
	echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

