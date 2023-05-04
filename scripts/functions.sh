composer_link() {
    composer config repositories."$1" '{"type": "path", "url": "'"$1"'"}'
}

# Clone a package on github to local directory
# And link it as a_package.
clone_package() {
    if [ -n "$1" ]; then # If command line argument is present
        package_dir="$HOME/code/packages"

        mkdir -p "$package_dir"

        # if input is git@github.com:pkboom/asdf.git
        # package=asdf
        package=$(echo "$1" | cut -d/ -f2- | sed 's/\.git//')

        git clone "$1" "$package_dir/$package"

        ln -s "$package_dir/$package" a_package

        cd a_package && ./configure-skeleton.sh
    else
        echo 'Stay in Laravel application'
        echo 'Usage: package_clone [remote url on github]'
    fi
}

web() {
    cd "$HOME"/code && ls
}

dev() {
    if [ -n "$1" ]; then
        cd "$1" && npm run dev
    else
        npm run dev
    fi
}

watch() {
    if [ -n "$1" ]; then
        cd "$1" && npx mix watch
    else
        npx mix watch
    fi
}

xdebug() {
    # Anything after a ? in the first argument is used as the prompt string in zsh
    # equivalent to -p in bash
    # -k [ num ]: Read only one (or num) characters.
    # equivalent to -n in bash
    # read -k 1 -r "?Is php 8.1 and is xdebug /usr/lib/php/20210902/xdebug.so? "

    iniFileLocation=$(php --ini | grep '/php.ini' | cut -f2 -d: | sed 's/ //g')

    currentLine=$(grep xdebug.so "$iniFileLocation")

    if [ -z "$currentLine" ]; then
        sudo sh -c "cat << 'EOF' >> $iniFileLocation
zend_extension=xdebug.so
xdebug.mode=debug
xdebug.start_with_request=yes
EOF"

        echo "xdebug is now active"
        return
    fi

    if [[ $currentLine =~ ^#zend_extension ]]; then
        sudo sed -i -e 's/^#zend_extension/zend_extension/g' "$iniFileLocation"
        sudo sed -i -e 's/^#xdebug.mode/xdebug.mode/g' "$iniFileLocation"
        sudo sed -i -e 's/^#xdebug.start_with_request/xdebug.start_with_request/g' "$iniFileLocation"
        echo "xdebug is now active"
    else
        sudo sed -i -e 's/^zend_extension/#zend_extension/g' "$iniFileLocation"
        sudo sed -i -e 's/^xdebug.mode/#xdebug.mode/g' "$iniFileLocation"
        sudo sed -i -e 's/^xdebug.start_with_request/#xdebug.start_with_request/g' "$iniFileLocation"
        echo "xdebug is now inactive"
    fi

    echo
    echo 'Restarting web server...'

    valet restart
}

db() {
    if [ "$1" = "refresh" ]; then
        mysql -uroot -e "drop database $2; create database $2"
    elif [ "$1" = "create" ]; then
        mysql -uroot -e "create database $2"
    elif [ "$1" = "drop" ]; then
        mysql -uroot -e "drop database $2"
    elif [ "$1" = "list" ]; then
        mysql -uroot -e "show databases"
    fi
}

describe() {
    database=$1
    table=$2

    if [ "$DATABASE_MANAGEMENT_SYSTEM" = "mysql" ]; then
        if [ -z "$2" ]; then # If no table
            psql -c "\d" "$database"
        else
            psql -c "\d $table" "$database"
        fi
    else
        if [ -z "$1" ]; then # If no database
            mysql -uroot -e "show databases"
        elif [ -z "$2" ]; then # If no table
            mysql -uroot -e "use $1; show tables"
        else
            mysql -uroot -e "use $1; describe $2"
        fi
    fi
}

switch_db() {
    PS3="Select DB: "
    connections=("mysql" "postgres")

    select connection in "${connections[@]}"; do
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

    echo "✓ Connected to $connection"
    export DATABASE_MANAGEMENT_SYSTEM=$connection
}

import_formats() {
    wget https://raw.githubusercontent.com/pkboom/format/master/.eslintrc.js
    wget https://raw.githubusercontent.com/pkboom/format/master/.php-cs-fixer.dist.php
    wget https://raw.githubusercontent.com/pkboom/format/master/.prettierrc
}

# deprecated
import_tinker_config() {
    wget https://raw.githubusercontent.com/pkboom/import/master/tinker.config.php

    echo -e '\nPSYSH_CONFIG=tinker.config.php' >>.env
}

import_jsconfig() {
    wget https://raw.githubusercontent.com/pkboom/import/master/jsconfig.json
}

create_autoload_files() {
    echo "This will create a 'autoload/files' in 'composer.json'"
    echo -n 'Make sure you are in a project. Ready?'
    read -r

    # -O -: Download the contents of a URL to standard output
    # -q: quiet
    wget -O - -q https://raw.githubusercontent.com/pkboom/import/master/create_autoload_files.php | php

    wget -q https://raw.githubusercontent.com/pkboom/import/master/helpers.php --output-document app/helpers.php

    composer dump-autoload -d "$PWD"
}

mkdircd() {
    mkdir -p "$@" && cd "$@" || exit
}

rmrf() {
    rm -rf "$1"
}

cy() {
    if [ -z "$1" ]; then # If no argument
        npx cypress run
    else
        npx cypress run "$1"
    fi
}

uuid() {
    uuidgen | tee /dev/tty | tr -d '\n' | xclip -sel clip
}

myip() {
    curl -s https://ipecho.net/plain | tee /dev/tty | xclip -sel clip
}

clear-port() {
    if [ -z "$1" ]; then
        port=8080
    else
        port=$1
    fi

    kill "$(lsof -i:$port | tail -n 1 | awk '{print $2}')"

    # lsof -i -P -n | grep LISTEN | grep 80
    # -P: inhibits the conversion of port numbers to port names for network files.
    # -n: inhibits the conversion of network numbers to host names for network files.
}

storm() {
    open -a /Applications/PhpStorm.app "$1"
}

# open a project on chrome
page() {
    DIR=${PWD##*/}

    open http://"$DIR".test
}

create-deploy() {
    wget --directory-prefix ./.github/workflows https://raw.githubusercontent.com/pkboom/import/master/deploy.yml
}

gh_list() {
    GREEN='\033[1;32m'
    NC='\033[0m' # No Color

    echo "gh repo delete"
    echo "${GREEN}➜${NC} delete current repo"
    echo
    echo "gh repo delete <repo>"
    echo "${GREEN}➜${NC} delete <repo>"
    echo
    echo "gh repo edit --visibility public"
    echo "${GREEN}➜${NC} make current repo public"
    echo
    echo "gh repo edit --visibility private"
    echo "${GREEN}➜${NC} make current repo private"
    echo
    echo "gh repo rename new_name"
    echo "${GREEN}➜${NC} rename current repo"
    echo
    echo "gh workflow run <workflow.yml>"
    echo "${GREEN}➜${NC} run workflow"
    echo
    echo "gh run list --workflow=<workflow.yml> --limit 1 --json status"
    echo "${GREEN}➜${NC} get workflow status"
    echo
    echo "gh repo set-default"
    echo "${GREEN}➜${NC} set current repo as default"
    echo
    echo "gh secret set SSH_PRIVATE < ~/.ssh/id_ed25519"
    echo "${GREEN}➜${NC} set actions secret SSH_PRIVATE for current repo"
    echo
    echo "gh ssh-key add ~/.ssh/id_ed25519.pub --title <title>"
    echo "${GREEN}➜${NC} add ssh key to github"
    echo
    echo "gh auth login"
    echo "${GREEN}➜${NC} login to github"
}
