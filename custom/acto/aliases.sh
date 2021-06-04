
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias dev='npm run dev'

# Git
alias gp="git push"
alias gs="git status"
alias gc="git commit -m"
alias ga="git add ."
alias gl='git log --decorate --oneline --graph --all'
alias gch='git checkout'
alias gb="git branch"
alias gbd="git branch -D"
alias nah="git reset --hard && git clean -df"

alias pbcopy='xclip -sel clip'
alias publish='legit publish'
alias unpublish='legit unpublish'