
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# added by travis gem
[ -f /home/kevcaz/.travis/travis.sh ] && source /home/kevcaz/.travis/travis.sh


########## ALIASES ##########

# current directory in atom
alias aa="atom -a ."
# current directory in vscodium
alias vs="codium -a ."



# New windows of file manager here
nw() {
  nautilus -w .
}

# edit zshrc
alias zedit="atom ~/.zshrc"

# edit source.list
alias sedit="sudo nano /etc/apt/sources.list"

# dropbox
alias dbox='~/.dropbox-dist/dropboxd &'

# duf 
alias duf='~/Applications/duf/duf'


# to display hidden files
alias ls='ls -a'
alias lls='ls -alh'

# todolist
alias todo='atom -a ~/Github/Others/toutdoux'


# pwd to clipborad  
alias pwdc='pwd | xclip -selection clipboard'

# Searches
# Find processus
alias psgrep='ps aux | grep'
# search expression in files
alias sz='grep -rnw ~ -e'
# search file name in user file
alias ff='find ~ -name'
alias ffi='find ~ -iname'
## List of csl available
alias csl='ls  ~/Zotero/styles/*.csl'
## Search in Zotero database
alias sz='grep -rnw ~/Zotero/storage/ -e'
## Search in all docs
alias seadoc='grep -rnw /home/kevcaz/ -e'
## Search in installed packages
alias seapkgi='apt-get list --installed | grep'

# Go to Github directories
alias ghb='cd ~/Projects/books'
alias ghg='cd ~/Projects/gists'
alias ghi='cd ~/Projects/inSileco'
alias ghr='cd ~/Projects/R'
alias ght='cd ~/Projects/tutorials'
alias ghw='cd ~/Projects/websites'
alias ghm='cd ~/Projects/mccannlab'
alias ghms='cd ~/Projects/manuscripts'
alias ghq='cd ~/Projects/qcbs'
alias dot='cd ~/Applications/dotfiles && atom -a .'
alias pro='cd ~/Projects'
alias app='cd ~/Applications'
alias dow='cd ~/Downloads'
alias doc='cd ~/Documents'
alias kc='cd ~/.kevcaz'

## Use bfg  https://rtyley.github.io/bfg-repo-cleaner/
alias bfg='java -jar ~/.local/lib/java/bfg-1.13.0.jar'

# Create a gitignore dotfile with the MacOS most annoying file
alias gig='echo ".DS_Store" > .gitignore'
alias ged='git add -A; git commit --amend'
alias ggp='sh ~/.kevcaz/scripts/emptybranchghpages'

# Generate ssh keys
alias mykeygen='ssh-keygen -t rsa -b 4096 -C "$(git config user.email)" -f gh-pages -N ""'



# Go to
alias gorev='cd ~/Documents/Research/Reviews'
alias gopci='cd ~/Documents/Reviews/PCI'

alias gopas='atom -a ~/.kevcaz/docs/pass.md'
alias notes='atom -a ~/.kevcaz/docs/notes.md'

# change screen and keyboard backlight
alias mysbl='sudo tee /sys/class/backlight/intel_backlight/brightness <<<'
alias mykbl='sudo tee /sys/class/leds/tpacpi::kbd_backlight/brightness <<<'

# open a file
alias pop='xdg-open'
# open tor
alias tor='cd ~/Tor; ./start-tor-browser.desktop'

# open sage
# alias sage='~/Github/Applications/sage/sage'

## update debian packages
alias updeb='sudo apt-get update && sudo apt-get upgrade'
## update python packages
alias uppy='
  for i in  $(pip list --outdated --format=columns |tail -n +3|cut -d" " -f1); do pip install --user $i --upgrade
  done'
## update R package in 'R_LIBS_USER'
alias upr='Rscript --no-init-file -e "update.packages(Sys.getenv(\"R_LIBS_USER\"), ask = FALSE)"'
## update Julia packages 
alias upj='julia -e "using Pkg; Pkg.update()"'


## update my publication
alias mypubs='R -e "mypubs()"'

## update atom
alias atomup='aria2c https://atom.io/download/deb && sudo dpkg -i atom-amd64.deb && rm atom-amd64.deb'

# R alias
# in order to use little, we need to re-assign r otherwise with zsh it keeps
# repeating the last command.
alias R=radian
alias r=/usr/bin/r
## edit Renviron.site
alias renvi='sudo nano /usr/lib/R/etc/Renviron.site'
alias redit='atom ~/.Rprofile'
alias rhome='cd /usr/lib/R'
alias rupdate='update.r -l /usr/local/lib/R/site-library'
alias clean_r='rm -rf src/*.o src/*.so man'

# Websites
## launch my website
alias hukev='ghw && cd KevCaz.github.io && hugo server &; firefox http://localhost:1313/; fg;'
## launch inSileco local website
alias insil='cd ~/Projects/inSileco/inSileco.github.io; Rscript --no-site-file -e "blogdown::serve_site()"'



# encoding/decoding url
# https://unix.stackexchange.com/questions/159253/decoding-url-encoding-percent-encoding
alias urldecode='python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'

## Julia
alias judit='atom ~/.julia/config/startup.jl'
alias julia='~/Applications/julia/julia'

## sage 
alias sage='~/Applications/sage/sage'

## node 
alias node='~/Applications/node/node'


########## FUNCTIONS ##########

# Add a new note on my website
newnotes() {
  cd ~/Github/Websites/KevCaz.github.io
  for a in "$@" # Loop over arguments
  do
    hugo new notes/$a
  done
}


# Meteo
meteo() {
  curl wttr.in/$1
}

# Linux permissions
permi(){
  curl cheat.sh/chmod/$1
}


# Install an R package
rinstall() {
  for pkg in "$@"
  do
    Rscript -e "install.packages('$pkg')"
  done
}

convR() {
  FROM=${2:-fahrenheit}
  TO=${3:-celsius}
  Rscript -e "conv('$1', '$FROM', '$TO')"
}

# Search new package
findpkg() {
  apt-cache search $1 | grep $1
}

# Classical git
mygit() {
  git add -A;
  git commit -m "$1";
  git push;
}

# Classical git no push
mygitl() {
  git add -A;
  git commit -m "$1";
}

# to outBox
outbox() {
  mv $@ ~/Dropbox/outBox/
}

# show and copy 
function showandcopy() {
  echo $1
  echo -n $1 | xclip -selection clipboard
}

# Get a DOI using crossref https://stackoverflow.com/questions/9354847/concatenate-inputs-in-bash-script
getDOI() {
  request=""
  for a in "$@" # Loop over arguments
  do
    if [[ "${a:0:1}" != "-" ]] # Ignore flags (first character is -)
    then
      if [[ "$request" != "" ]]
      then
        request+="+" # Delimeter
      fi
      request+="$a"
    fi
  done
  firefox "https://search.crossref.org/?q=$request"
}

# Get a ref from a DOI
getRef() {
 firefox http://sci-hub.se/$1
}
# Get a pdf from a DOI
getPdf() {
 wget "$(wget -qO- http://sci-hub.se/$1 | grep iframe | grep -o 'https*://[^"]*')" -P ~/Downloads
}



## New review
newreview() {
  VAR1=${1:-$RANDOM}
  NEWR=review_current$VAR1
  cd ~/Documents/Research/Reviews
  cp -r emptyreview/ $NEWR
  echo "Created: "$NEWR
  atom -a $NEWR
}

newdraft() {
  NEWD=$(date '+%Y-%m-%d')${1:-$RANDOM}
  atom -a ~/.kevcaz/docs/drafts/draft_$NEWD.md
}

newrmd() {
  echo "---\nauthor: Kevin Cazelles\n---" > $1.Rmd
}

##
newbackup() {
  dir='/media/kevcaz/work/backup/'$(date '+%Y-%m-%d')
  mkdir $dir
  echo $dir has been created!

  echo Now copying /Documents...
  cp -r ~/Documents $dir
  
  echo Now copying /Projects...
  cp -r ~/Projects $dir

  echo Now creating an archive of /Pictures...
  tar -czf $dir/Pict.tar.gz --absolute-names ~/Pictures

  echo Now creating an archive of /Zotero...
  tar -czf $dir/Zotero.tar.gz --absolute-names ~/Zotero

  echo Now creating the last archive...
  tar -czf $dir/other_important.tar.gz --absolute-names /usr/lib/R/etc/Renviron.site ~/.local ~/.kevcaz ~/.gnupg ~/.password-store
}

## Install R packages
rpkg() {
 sudo Rscript --no-init-file  -e "install.packages('$1', repos='https://cran.wu.ac.at/')";
}

## Convert a rmarkdown files
rmdto() {
  Rscript --no-init-file -e "rmarkdown::render('$1', output_format = 'all')";
}

## Convert a file to pdf using pandoc
topdf() {
  pandoc $1 -o ${1%.*}.pdf --bibliography=/home/kevcaz/Dropbox/kevcaz.bib --pdf-engine=pdflatex
}

## Convert a file to docx using pandoc
todocx() {
  pandoc $1 -o ${1%.*}.docx --bibliography=/home/kevcaz/Dropbox/kevcaz.bib
}

## Convert a file to odt
toodt() {
  pandoc $1 -o ${1%.*}.odt --bibliography=/home/kevcaz/Dropbox/kevcaz.bib
}

## Convert xlsx or xls to csv files (one per sheet)
tocsv() {
  ssconvert -S $1 %s.csv;
}

##
towebfonts() {
  fontforge -script ~/.kevcaz/scripts/towebfonts.pe $1;
}


## Change extensions
chgext() {
  for file in *.$1
  do
    mv "$file" "${file%.$1}.$2"
  done
}

## Send to trash
junk() {
  mv "$@" ~/.Trash/;
 }


## watch youtube video
youtube-wt() {
  cvlc "$(youtube-dl -g -f mp4 $1)"
}


source ~/.kevcaz/docs/extralias.sh