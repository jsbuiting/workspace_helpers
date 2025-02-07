

HISTFILE=${ZDOTDIR:-$HOME}/.history
HISTSIZE=50000
SAVEHIST=50000
export HISTSIZE=50000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
alias history="history 1 -1"

setopt HIST_FIND_NO_DUPS
# following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

PS1='%n@%m:%~$ '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

gch() {
 git checkout "$(git branch --sort=-committerdate | fzf | tr -d '[:space:]')"
}


gbd() {
 git branch -D "$(git branch --sort=-committerdate | fzf | tr -d '[:space:]')"
}


gm() {
 git merge "$(git branch --sort=-committerdate | fzf | tr -d '[:space:]')"
}

gchrb() {
 git checkout "$(for branch in $(git branch -r | grep -v HEAD | cut -d/ -f2- | comm -23 - <(git branch | cut -c3-)); do
  echo "$(git log -1 --format="%at %ar|$branch" origin/$branch)"
done | sort -n | cut -d'|' -f2 | fzf | tr -d '[:space:]')"
}


alias gb="git branch --sort=-committerdate"
alias hg="history | grep "
alias gcb="git checkout -b "
alias gc="git checkout "
alias pfg="pip freeze | grep"
alias gs="git status"
alias ht="history | tail -n 50"
alias gsp="git stash pop"
alias src="source ~/.zshrc"
alias gbnr="git fetch --prune
git branch -vv | grep ': gone]' | awk '{print $1}'"
alias gsl="git stash list"
ChatGPT said:
