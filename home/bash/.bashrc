#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

# Sets the prompt
# Literally the default from gentoo
# Taken from: https://gitweb.gentoo.org/repo/gentoo.git/tree/app-shells/bash/files/bashrc
# Just changed it so that it shows the full hostname (Distrobox for example)
PS1="\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\] "

# tbh I only use eza because the colours look good, if there is an alternative I will switch
alias ls="ls --color"
alias l="ls --color -lh"
alias ll="ls --color -lah"

alias h="echo h"
# Legacy because distrobox is a thing, keeping it for history's sake
alias epitest="docker run --rm -it -v $(pwd):/usr/src/project epitechcontent/epitest-docker /bin/bash -c \"cd /usr/src/project; exec bash\""
# I hate perf so much for this >:(
alias perfrep="perf report -g 'graph,0.5,caller'"
alias perfrec="perf record -g"
# Removes all local git branches that are not on the remote, you may want to call `git remote prune origin` before
alias git-remove-untracked='git fetch --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -d'
alias time="$(which time) -f '\t%E real,\t%U user,\t%S sys,\t%K amem,\t%M mmem'"

# Make go brrrrrrrr (You definetely want to change this if your pc doesn't have 16 cores and 32GB of RAM)
export MAKEFLAGS="-j14"

# gpg signing in terminal without a secrets manager
export GPG_TTY=$(tty)

export EDITOR=vim
export VISUAL=vim

alias wttr="curl https://wttr.in/toulouse"
alias ufda="echo 'use flake' | tee .envrc; direnv allow"
alias updls="betterlockscreen -u ~/assets/wallpaper.png"
alias ff="fastfetch"

# We doing a little bit of trolling :3
function mayhem() {
    sed -i "s/;/;/g" $@
}
