# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="ls -lh --color=auto"
alias la="ls -lAh --color=auto"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias compile="commit 'compile'"
alias version="commit 'version'"

# Directories
alias dotfiles="cd $DOTFILES"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="php -d memory_limit=-1 /opt/homebrew/bin/composer"

# Git
alias gp="git push"
alias gpd="git push origin --delete"
alias gs="git status"
alias gc="git commit -m"
alias gca="git commit -a -m"
alias ga="git add ."
alias gl='git log --decorate --oneline --graph --all'
alias gch='git checkout'
alias gchd='git checkout develop'
alias gbd="git branch -D"
alias gr="git rebase"
alias gt="git tag"
alias nah="git reset --hard && git clean -df"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias mix='npx mix'

# Docker
alias dc="docker compose"
