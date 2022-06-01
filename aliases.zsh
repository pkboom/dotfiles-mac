# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
# alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias compile="commit 'compile'"
alias version="commit 'version'"

# Directories
alias dotfiles="cd $DOTFILES"
alias web="cd $HOME/code"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="php -d memory_limit=-1 /opt/homebrew/bin/composer"

# Git
alias gp="git push"
alias gpf="git push -f"
alias gs="git status"
alias gc="git commit -m"
alias gca="git commit -a -m"
alias ga="git add ."
alias gl='git log --decorate --oneline --graph --all'
alias gch='git checkout'
alias gchd='git checkout development'
alias gb="git branch"
alias gbd="git branch -D"
alias gr="git rebase"
alias gt="git tag"
alias nah="git reset --hard && git clean -df"
alias publish="git publish"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"
alias dev='npm run dev'
alias mix='npx mix'

# legit
alias publish='legit publish'
alias unpublish='legit unpublish'

alias sshkey="cat ~/.ssh/id_rsa.pub | tee /dev/tty | xclip -sel clip"
