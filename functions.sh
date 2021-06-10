
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
    else
        git add . && git commit -m 'wip'
    fi
}

web() { 
    cd $HOME/code && ls -lh; 
}

function art() {
    if [ -n "$1" ] && [ $1 = "fresh" ]; then
        php artisan migrate:fresh --seed
    else
        php artisan $@
    fi
}

function watch() {
    if [ -n "$1" ]; then
        eval "npm run watch-${1}"
    else
        npm run watch
    fi
}

function xdebug() {
    read -p "Is php 8.0 and is xdebug /usr/lib/php/20190902/xdebug.so " -n 1 -r

    echo

    if [[ ! $REPLY =~ ^[Yy]$ ]] then
        echo 'You better change it now.'

        exit 1
    fi

   iniFileLocation="/etc/php/8.0/cli/php.ini";
   
   currentLine=`cat $iniFileLocation | grep xdebug.so`

    if [ -z "$currentLine" ]; then
        sudo sh -c "cat << 'EOF' >> $iniFileLocation
zend_extension=/usr/lib/php/20190902/xdebug.so
xdebug.remote_enable=1
EOF"

        echo "xdebug is now active";
        return
    fi

   if [[ $currentLine =~ ^#zend_extension ]]; then
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

function describe() {
    database=$1
    table=$2

    if [ $DATABASE_MANAGEMENT_SYSTEM = "mysql" ]; then
        if [ -z "$2" ]; then # If no table
            mysql -uroot -e "use $1; show tables"
        else
            mysql -uroot -e "use $1; describe $2"
        fi
    else
        if [ -z "$2" ]; then # If no table
            psql -c "\d" $database
        else
            psql -c "\d $table" $database
        fi
    fi
}

function switch_db() {
    PS3="Select DB: "
    connections=("mysql" "postgres")

    select connection in "${connections[@]}"
    do
        case $connection in
            "mysql")
                break
                ;;
            "postgres")
                break
                ;;
            *)
                echo "Invalid option $REPLY"
                ;;
        esac
    done

    echo "connected to $connection"
    export DATABASE_MANAGEMENT_SYSTEM=$connection
}

import-format() {
    if [ -n "$1" ]; then # If command line argument is present
        cd $1

        wget https://raw.githubusercontent.com/pkboom/setup-files/master/.eslintrc.js
        wget https://raw.githubusercontent.com/pkboom/setup-files/master/.php_cs.dist
        wget https://raw.githubusercontent.com/pkboom/setup-files/master/.prettierrc    
    else
        wget https://raw.githubusercontent.com/pkboom/setup-files/master/.eslintrc.js
        wget https://raw.githubusercontent.com/pkboom/setup-files/master/.php_cs.dist
        wget https://raw.githubusercontent.com/pkboom/setup-files/master/.prettierrc    
    fi
}

function mkdircd() {
   mkdir -p "$@" && cd "$@"
}

function rmrf() {
    rm -rf "$1"
}

function dock() {
    if [ "$1" = "watch" ]; then
        docker-compose exec php npm run watch 
    elif [ "$1" = "dump" ]; then
        docker-compose exec php php artisan dump-server
    elif [ "$1" = "tinker" ]; then
        docker-compose exec php php artisan tinker
    elif [ -n "$1" ]; then
        docker-compose exec php $@
    else
        docker-compose exec php zsh
    fi
}