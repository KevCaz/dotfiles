# I cannot get no credit for this....
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
#
# Browser
#
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#
export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

#
# Language
#
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )


#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi





##### KevCaz's setup  #####

###
# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /home/kevcaz/.local/{bin,sbin}
  $path
)
# welcome
source ~/.welcome


#### Alias

# dropbox
alias dbox='~/.dropbox-dist/dropboxd &'

# firefox stable
alias fire='snap run firefox &'

# to display hidden files
alias ls='ls -a'

# to display current a directory within the finder
alias finderit='open -a Finder'

# todolist
alias todo='nano ~/ownCloud/todolist.md'

# reading list
alias toread='nano ~/.toread'

# watching list
alias towatch='nano ~/.towatch'

# Get access to Mp2
alias tomam='ssh kevcaz@dgravel-mp2.ccs.usherbrooke.ca'
# Send something to Mp2
sendtomam() {
  scp -rp $1 kevcaz@dgravel-mp2.ccs.usherbrooke.ca:${2-./}
}
# Get from Mp2
getfrommam() {
  scp -rp kevcaz@dgravel-mp2.ccs.usherbrooke.ca:$1 $2
}

# Find processus
alias psgrep='ps aux | grep'

# Search in installed packages
alias searchpkg='apt list --installed | grep'

# Go to Github bdirectory
alias gh='cd ~/Github'
alias ghr='cd ~/Github/Rpackages'
alias ghw='cd ~/Github/Websites'
alias ght='cd ~/Github/Tutorials'
alias gho='cd ~/Github/Others'
alias ghg='cd ~/Github/gists'

# open a file
alias pop='xdg-open'

# power off and reboot
alias pwo='sudo poweroff'
alias pwr='sudo reboot'


# change backlight
alias mybl='sudo tee /sys/class/backlight/intel_backlight/brightness <<<'

# open tor
alias tor='cd ~/Tor; ./start-tor-browser.desktop'

# update debian packages
alias updeb='sudo apt-get update && sudo apt-get upgrade'


# ppdate rpackage
alias udrpkgs='sudo Rscript --no-init-file -e "update.packages(ask=FALSE, repos=\"https://cran.wu.ac.at/\")"'

# launch InSileco website
alias insil='cd ~/Github/Websites/inSileco.github.io; Rscript -e "blogdown::serve_site()"'

# Backup
alias backupdc='rsync -av ~/Documents /media/kevcaz/KF/backup'
alias backupzo='rsync -av ~/Zotero /media/kevcaz/KF/backup'
alias backupgh='rsync -av ~/Github /media/kevcaz/KF/backup'
alias backupca='rsync -av ~/Calibre /media/kevcaz/KF/backup'
alias backall='backupdc; backupzo; backupgh; backupca'
#### Functions

# Search new package
findpkg() {
  apt-cache search $1 | $1
}

# Classical git
mygit() {
  git add -A;
  git commit -m "$1";
  git push;
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
 firefox http://sci-hub.cc/$1
}

# Get a pdf from a DOI
getPdf() {
 wget "$(wget -qO- http://sci-hub.cc/$1 | grep iframe | grep -o 'https*://[^"]*')" -P ~/Downloads
}



## New review
newreview() {
  cd ~/Documents/Reviews;
  cp -r emptyreview $1;
  atom -a $1
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
  pandoc $1 -o ${1%.*}.pdf;
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
