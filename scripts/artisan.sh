a() {
    if [ -n "$1" ]; then
        case $1 in
        fresh)
            php artisan migrate:fresh --seed
            ;;
        t)
            if [[ -n $2 ]]; then
                php artisan tinker-on-vscode --query "$2"
            else
                php artisan tinker-on-vscode --query
            fi

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
