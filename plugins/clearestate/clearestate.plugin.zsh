#--------------------------------------------------------------------------
# Clear Estate plugin for zsh
#--------------------------------------------------------------------------

function _find_nix() {
    # Look for nix up the file tree until the root directory
    local dir=.
    until [ $dir -ef / ]; do
        if [ -f "$dir/nix/scripts/ce" ]; then
            echo "$dir/nix"
            return 0
        fi

        dir+=/..
    done

    return 1
}

function _add_completion() {
    if [ "$(_find_nix)" != "" ]; then
        local commands=(
            list
            init
            up
            yarn
            migrate-fresh
            migrate-refresh
            down
            artisan
            artisan-models
            migrate
            migrate-rollback
            testdb-migrate
            testdb-migrate-refresh
            testdb-migrate-rollback
            yarn-cypress
        )

        compadd -a -q commands
    else
        echo
        echo "Are you in clearestate-app?"
    fi
}

compdef _add_completion ce
