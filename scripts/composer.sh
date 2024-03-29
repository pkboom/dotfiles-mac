c() {
    if [ -n "$1" ]; then
        case $1 in
        i)
            composer install
            ;;
        u)
            composer update
            ;;
        d)
            composer dump-autoload
            ;;
        *)
            composer "$@"
            ;;
        esac

        return
    fi

    PS3="Select composer command: "
    composer_commands=("require" "remove" "create" "link" "clone")

    select command in "${composer_commands[@]}"; do
        echo "$command"

        case $command in
        create)
            create_package
            ;;
        link)
            link_repository
            ;;
        clone)
            clone
            ;;
        *)
            require_remove_package "$command"
            ;;
        esac

        return
    done
}

clone() {
    PS3="Select package: "
    packages=(
        "laravel-dump-server"
        "laravel-grab"
        "laravel-test-watcher"
        "laravel-tinker-on-vscode"
        "move-class"
        "test-creator"
        "dump-variable"
        "laravel-pick"
    )

    select package in "${packages[@]}"; do
        break
    done

    if ! [[ $REPLY =~ ^[0-9]+$ ]]; then
        package=$REPLY
    fi

    printf "git clone git@github.com:pkboom/%s.git %s" "$package" "/Users/keunbae/code/packages/$package"
    echo

    git clone git@github.com:pkboom/"$package".git /Users/keunbae/code/packages/"$package"

    code /Users/keunbae/code/packages/"$package"
}

require_remove_package() {
    PS3="Select package: "
    packages=(
        "pkboom/laravel-dump-server --dev"
        "pkboom/laravel-grab --dev"
        "pkboom/laravel-test-watcher --dev"
        "pkboom/laravel-tinker-on-vscode --dev"
        "pkboom/move-class --dev"
        "pkboom/test-creator --dev"
        "pkboom/dump-variable --dev"
        "symfony/var-dumper --dev"
        "pkboom/laravel-pick --dev"
    )

    select package in "${packages[@]}"; do
        break
    done

    if ! [[ $REPLY =~ ^[0-9]+$ ]]; then
        package=$REPLY
    fi

    printf "composer %s %s" "$1" "$package"
    echo

    $(printf "composer %s %s" "$1" "$package")
}

link_repository() {
    PS3="Select package: "
    packages=($HOME/code/packages/*)

    select package in "${packages[@]}"; do
        case $package in
        *)
            composer config repositories."$package" '{"type": "path", "url": "'"$package"'"}'
            return
            ;;
        esac
    done
}

# Clone skeleton-php on github to local directory
# And link it as a_package.
create_package() {
    read -r "name?Package name: "

    SKELETON="git@github.com:pkboom/skeleton-php.git"

    if [ -n "$name" ]; then
        package_dir="$HOME/code/packages"

        mkdir -p "$package_dir"

        git clone $SKELETON "$package_dir/$name"

        ln -s "$package_dir/$name" a_package

        cd a_package && ./configure-skeleton.sh && rmrf .git
    else
        echo 'Need package name.'
    fi
}
