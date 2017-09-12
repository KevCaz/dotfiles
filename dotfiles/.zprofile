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

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

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





######## KevCaz's stuff #######


#### Alias

# dropbox
alias dbox='~/.dropbox-dist/dropboxd'

# to display hidden files
alias ls='ls -a'

# to display current a directory within the finder
alias finderit='open -a Finder'

# todolist
alias todo='nano ~/.todolist'

# tomamouth
alias tomam='ssh kevcaz@dgravel-mp2.ccs.usherbrooke.ca'

# Find processus
alias psgrep='ps aux | grep'

# Go to Githu bdirectory
alias gh='cd ~/Github'

# Update rpackage
alias udrpkgs='sudo Rscript  -e "update.packages(ask=FALSE)"'


#### Functions

# Classical git
mygit() {
  git add -A;
  git commit -m "$1";
  git push;
}

## New review
newreview() {
  cd ~/Documents/Reviews;
  cp -r emptyreview $1;
  atom -a $1
}

## Install R packages
rpkg() {
 sudo  Rscript --no-init-file  -e "install.packages('$1')";
}

## Convert a rmarkdown files
convrmd() {
  Rscript --no-init-file -e "rmarkdown::render('$1', output_format = 'all')";
}


## Convert a file to pdf using pandoc
topdf() {
  pandoc $1 -o ${1%.*}.pdf;
}

## Send to trash
junk() { 
  mv "$@" ~/.Trash/; 
 }

