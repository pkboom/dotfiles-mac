a() {
    if [ -n "$1" ]; then
        case $1 in
        fresh)
            if [[ -n $2 ]]; then
                php artisan migrate:fresh --seed "$2"
            else
                php artisan migrate:fresh --seed
            fi

            ;;
        t)
            php artisan tinker-on-vscode

            ;;
        d)
            php artisan dump-server
            ;;
        *)
            php artisan "$@"
            ;;
        esac

        return
    fi

    php artisan
}
