# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"
alias dev='npm run dev'

# Git
alias gp="git push"
alias gs="git status"
alias gc="git commit -m"
alias ga="git add ."
alias gl='git log --decorate --oneline --graph --all'
alias gch='git checkout'
alias gchm='git checkout master'
alias gb="git branch"
alias gbd="git branch -D"
alias nah="git reset --hard && git clean -df"
alias publish='legit publish'
alias unpublish='legit unpublish'

DIR=${PWD##*/}
if [ "code" = "$DIR" ] || [ "projects" = "$DIR" ]; then
    ls
fi
