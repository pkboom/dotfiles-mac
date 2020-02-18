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
alias gpub='git push -u origin HEAD'

DIR=${PWD##*/}
if [ "code" = "$DIR" ] || [ "projects" = "$DIR" ]; then
    ls
fi

composer-link() {  
    composer config repositories.local '{"type": "path", "url": "'$1'"}'
}

package-new() {
    if [ -n "$1" ]; then # If command line argument is present
        dir='$HOME/code/packages'

        git clone https://github.com/pkboom/skeleton-php "$dir/$1"

        ln -s "$dir/$1" a_package
    else
        echo 'You need a package name'
    fi
}

wip() {
    if [ "$1" = "up" ]; then
        git add . && git commit -m 'wip' && git push
    elif [ "$1" = "pub" ]; then
        git add . && git commit -m 'wip' && git push -u origin HEAD
    else
        git add . && git commit -m 'wip'
    fi
}

# Directories
web() { cd $HOME/code && ls -lh; }
dotfiles() { cd $DOTFILES && ls -lh; }

# Laravel
art() {
    if [ -n "$1" ]; then # If command line argument is present
        if [ $1 = "fresh" ]; then
            php artisan migrate:fresh --seed
        else
            php artisan $@
        fi
        return
    fi
    php artisan
}

# https://alexvanderbist.com/posts/2019/running-laravel-scheduler-without-setting-up-cron
function scheduler () {
    while :; do
        php artisan schedule:run
    	echo "Sleeping 60 seconds..."
        sleep 60
    done
}


function weather() {
   city="$1"

   if [ -z "$city" ]; then
      city="Hamilton"
   fi

   eval "curl http://wttr.in/${city}"
}