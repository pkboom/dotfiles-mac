
composer-link() {  
    composer config repositories.local '{"type": "path", "url": "'$1'"}'
}

package-new() {
    if [ -n "$1" ]; then # If command line argument is present
        dir="$HOME/code/packages"

        mkdir -p $dir

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

xdebug() {
   iniFileLocation="/usr/local/etc/php/7.4/php.ini";
   
   currentLine=`cat $iniFileLocation | grep xdebug.so`

    if [ -z "$currentLine" ]; 
    then
        sudo sh -c "cat << 'EOF' >> $iniFileLocation
zend_extension=xdebug.so
xdebug.remote_enable=1
EOF"

        echo "xdebug is now active";
        return
    fi

   if [[ $currentLine =~ ^#zend_extension ]];
   then
      sudo sed -i -e 's/^#zend_extension/zend_extension/g' $iniFileLocation
      sudo sed -i -e 's/^#xdebug.remote_enable/xdebug.remote_enable/g' $iniFileLocation
      echo "xdebug is now active";
   else
      sudo sed -i -e 's/^zend_extension/#zend_extension/g' $iniFileLocation
      sudo sed -i -e 's/^xdebug.remote_enable/#xdebug.remote_enable/g' $iniFileLocation
      echo "xdebug is now inactive";
   fi
}

db() {
    if [ "$1" = "refresh" ]; then
        mysql -uroot -e "drop database $2; create database $2"
    elif [ "$1" = "create" ]; then
        mysql -uroot -e "create database $2"
    elif [ "$1" = "drop" ]; then
        mysql -uroot -e "drop database $2"
    fi
}

describe() {
    table=$1

    database='touchstone'

    psql -c "\d $table" $database
}

import-format() {
    if [ -n "$1" ]; then # If command line argument is present
        cd $1

        wget https://raw.githubusercontent.com/pkboom/format/master/.eslintrc.js
        wget https://raw.githubusercontent.com/pkboom/format/master/.php_cs.dist
        wget https://raw.githubusercontent.com/pkboom/format/master/.prettierrc    
    else
        wget https://raw.githubusercontent.com/pkboom/format/master/.eslintrc.js
        wget https://raw.githubusercontent.com/pkboom/format/master/.php_cs.dist
        wget https://raw.githubusercontent.com/pkboom/format/master/.prettierrc    
    fi
}