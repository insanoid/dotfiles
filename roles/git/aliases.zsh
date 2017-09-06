alias g="git"
alias gf="git flow"

# Some shortcuts I used with Oh My Zsh
alias gaa='git add --all'
alias gcd='git checkout develop'
alias gci='git-checkout-issue'
alias gcm='git checkout master'
alias gdm='git diff master'
alias gl="git pull"
alias glm='git log ...master'
alias gs="git status"
alias gst="git status"
alias gsta='git add -A; git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gwip='git add -A; git ls-files --deleted -z | xargs git rm; git commit -m "--wip--"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
